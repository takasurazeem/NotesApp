//
//  NotesViewModel.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import Combine
import Foundation
import SwiftUI

extension NotesDashboard {
    class ViewModel: ObservableObject {
        @Published var text: String
        @Published private(set) var notes: [Note] = []
        
        init() {
            self.text = ""
            loadNotes()
        }
        
        private func save() {
            do {
                // Convert the notes array to data using JSONEncoder
                let data = try JSONEncoder().encode(notes)
                // Create a new URL to save the file using ``getDocumentDirectory`` method
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // Write the data to given URL
                try data.write(to: url)
            } catch {
                // I don't like print statements.
                fatalError("Failed to write to file.")
            }
        }
        
        private func loadNotes() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                do {
                    // Get notes url path.
                    let url = getDocumentDirectory().appendingPathComponent("notes")
                    // Create a new property for data.
                    let data = try Data(contentsOf: url)
                    // Decode data and assign notes to notes array.
                    notes = try JSONDecoder().decode([Note].self, from: data)
                } catch {
                    notes = []
                }
#if DEBUG
                if notes.isEmpty {
                    self.notes.append(Note(text: "An examplary note for testing only."))
                }
#endif
            }
        }
        
        func addNote() {
            let note = Note(text: text)
//            dump(note)
            notes.append(note)
            text = ""
            save()
        }
        
        func getDocumentDirectory() -> URL {
            let path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
            return path[0]
        }
        
        func onDelete(_ deleteOffsets: IndexSet) {
            withAnimation {
                notes.remove(atOffsets: deleteOffsets)
                save()
            }
        }
    }
}
