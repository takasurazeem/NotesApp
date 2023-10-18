//
//  AddNoteView.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import SwiftUI

struct AddNoteView: View {
    @ObservedObject var viewModel: NotesDashboard.ViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            TextField("Add New Note", text: $viewModel.text)
            Button {
                viewModel.addNote()
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 42, weight: .bold))
            }
            .fixedSize()
            .buttonStyle(.plain)
            .foregroundStyle(Color.accentColor)
            .tint(.accentColor)
            .disabled(viewModel.text.isEmpty)
        } //: HStack
    }
}

#Preview {
    AddNoteView(viewModel: NotesDashboard.ViewModel())
}
