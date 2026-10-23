//
//  ContentView.swift
//  TeenageEngineeringButton
//
//  Created by pascal jesenberger on 05/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.neutral1)
                .ignoresSafeArea()
            
            Image(.noise)
                .resizable(resizingMode: .tile)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Spacer()
                
                HStack(spacing: 16) {
                    EngineeringButton(text: "RECORD", palette: .orange) {}
                    EngineeringButton(text: "SOUND", palette: .darkGray) {}
                    EngineeringButton(text: "ERASE", palette: .white) {}
                }
                
                HStack(spacing: 16) {
                    EngineeringButton(text: "SHIFT", palette: .lightGray) {}
                    EngineeringButton(text: "PLAY", palette: .gray) {}
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
