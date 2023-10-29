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
            if viewModel.notes.isEmpty {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
            } else {
                List {
                    ForEach(viewModel.notes) { note in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundStyle(Color(.accent))
                            Text(note.text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        }
                    }
                    .onDelete(perform: viewModel.onDelete(_:))
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
