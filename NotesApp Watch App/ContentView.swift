//
//  ContentView.swift
//  NotesApp Watch App
//
//  Created by Takasur A. on 16/10/2023.
//

import SwiftUI
import SFSymbol

struct ContentView: View {
    // MARK: Properties
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
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
            Spacer()
            Text("\(viewModel.notes.count)")
        } //: VStack
        .navigationTitle("Notes")
    }
}

#Preview {
    ContentView(viewModel: ContentView.ViewModel())
}
