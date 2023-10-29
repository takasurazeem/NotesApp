//
//  CreditsView.swift
//  NotesApp Watch App
//
//  Created by Takasur Azeem on 29/10/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            // PROFILE IMAGE
            // Image("")
            // Not adding an image.
            // HEADER
            HeaderView(title: "Credits")
            // CONTENT
            Text("Takasur Azeem")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        } //: VStack
    }
}

#Preview {
    CreditsView()
}
