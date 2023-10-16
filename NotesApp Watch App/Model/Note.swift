//
//  Note.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    let text: String
    
    init(
        id: UUID = UUID(),
        text: String
    ) {
        self.id = id
        self.text = text
    }
}
