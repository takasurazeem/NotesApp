//
//  NotesAppApp.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import SwiftUI

@main
struct NotesApp_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NotesDashboard(viewModel: NotesDashboard.ViewModel())
        }
    }
}
