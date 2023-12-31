//
//  ContentView.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import SwiftUI
import SFSymbol

struct NotesDashboard: View {
    // MARK: Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            AddNoteView(viewModel: viewModel)
            Spacer()
            Text("\(viewModel.notes.count)")
        } //: VStack
        .navigationTitle("Notes")
    }
}

#Preview {
    NotesDashboard(viewModel: NotesDashboard.ViewModel())
}
