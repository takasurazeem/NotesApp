//
//  HeaderView.swift
//  NotesApp Watch App
//
//  Created by Takasur Azeem on 29/10/2023.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Property
    
    var title: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            // TITLE
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.accent)
            }
            // SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundStyle(Color.accentColor)
        } //: VSTACK
    }
}

#Preview {
    Group {
        HeaderView(title: "Credits")
        HeaderView()
    }
}
