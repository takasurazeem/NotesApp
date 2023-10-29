//
//  NoteDetailView.swift
//  NotesApp Watch App
//
//  Created by Takasur Azeem on 29/10/2023.
//

import SwiftUI

struct NoteDetailView: View {
    // MARK: Property
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    
    // MARK: body
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView()
            // CONTENT
            Spacer()
            ScrollView {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented = true
                    }
            } //: HStack
            .foregroundStyle(.secondary)
            .sheet(isPresented: $isCreditsPresented) {
                CreditsView()
            }
        } //: VStack
    }
}

#Preview {
    NoteDetailView(
        note: Note(text: "Blockchain enables decentralized encryption of sensitive data. Once the domain of the dark web, the power of the blockchain can now be harnessed by everyday developers. This training course explains how to implement blockchain-based storage and encryption in the iOS framework using Swift. Instructor Mohammad Azam begins with the very basics, explaining all the details related to blockchain technology: cryptocurrency like bitcoin, distributed ledgers, keys, and mining. He shows how to implement the core elements of blockchain—models, keys, and blocks—and then builds smart contracts as well as a web API that exchanges data securely with the blockchain. Plus, learn how to decentralize blockchain even further using node-based processing and mining."),
        count: 5,
        index: 1
    )
}
