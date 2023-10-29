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
        NavigationStack {
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
                        ForEach(viewModel.notes.indices, id: \.self) { index in
                            NavigationLink(value: viewModel.notes[index]) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(Color(.accent))
                                    Text(viewModel.notes[index].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }
                            }
                            .navigationDestination(for: Note.self) { note in
                                NoteDetailView(
                                    note: note,
                                    count: viewModel.notes.count,
                                    index: index
                                )
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
}

#Preview {
    NotesDashboard(viewModel: NotesDashboard.ViewModel())
}
