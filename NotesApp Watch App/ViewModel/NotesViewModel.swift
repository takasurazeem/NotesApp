//
//  NotesViewModel.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import Combine

extension NotesDashboard {
    class ViewModel: ObservableObject {
        @Published var text: String
        @Published private(set) var notes: [Note] = []
        
        init() {
            self.text = ""
            self.notes.append(Note(text: "Initial Lengthy Note to see how it looks without adding a note again and again."))
        }
        
        func addNote() {
            let note = Note(text: text)
//            dump(note)
            notes.append(note)
            text = ""
        }
    }
}
