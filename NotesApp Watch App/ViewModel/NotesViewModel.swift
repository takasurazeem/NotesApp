//
//  NotesViewModel.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import Combine

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var text: String = ""
        @Published private(set) var notes: [Note] = []
        
        func addNote() {
            let note = Note(text: text)
//            dump(note)
            notes.append(note)
            text = ""
        }
    }
}
