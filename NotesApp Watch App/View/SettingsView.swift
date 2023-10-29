//
//  SettingsView.swift
//  NotesApp Watch App
//
//  Created by Takasur Azeem on 29/10/2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTY
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK: BODY
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
        } //: VSTACK
    }
    
    // MARK: - FUNCTIONS
    func update() {
        lineCount = Int(value)
    }
}

#Preview {
    SettingsView()
}
