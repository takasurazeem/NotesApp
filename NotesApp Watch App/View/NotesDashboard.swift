//
//  ContentView.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import SwiftUI

struct NotesDashboard: View {
    // MARK: Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            AddNoteView(viewModel: viewModel)
            List(viewModel.notes) { note in
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .background(Color.accentColor)
                        .frame(width: 4)
                    Text(note.text)
                        .lineLimit(1)
                        .font(.body)
                }
            }
            Spacer()
        } //: VStack
        .navigationTitle("Notes")
    }
}

#Preview {
    NotesDashboard(viewModel: NotesDashboard.ViewModel())
}
