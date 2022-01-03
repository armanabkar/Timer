//
//  ContentView.swift
//  Timer
//
//  Created by Arman Abkar on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CountdownModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                ZStack {
                    CircularProgressView()
                    ClockView()
                }
                
                HStack {
                    Button(action: { model.resetTimer() }) {
                        CircleButton(style: .reset)
                    }
                    .buttonStyle(.borderless)
                    Spacer()
                    Button(action: { model.playPauseAction() }) {
                        CircleButton(style: model.isRunning ? .pause : .start)
                    }
                    .buttonStyle(.borderless)
                    .disabled(model.disabledAction())
                }
                .padding(.horizontal, 25)
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountdownModel())
    }
}
