//
//  ContentView.swift
//  Timer
//
//  Created by Arman Abkar on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CountdownModel
    @State private var hours = [Int](0...23)
    @State private var minutes = [Int](0...59)
    @State private var seconds = [Int](0...59)
    
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
                
                Form {
                Picker("Hours", selection: $model.selectedHours.onChange(model.updateTimer)) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)")
                    }
                }
                Picker("Minutes", selection: $model.selectedMinutes.onChange(model.updateTimer)) {
                    ForEach(minutes, id: \.self) { minute in
                        Text("\(minute)")
                    }
                }
                Picker("Seconds", selection: $model.selectedSeconds.onChange(model.updateTimer)) {
                    ForEach(seconds, id: \.self) { second in
                        Text("\(second)")
                    }
                }
                }
                .padding(.top, 15)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: 200)
            }
            .onReceive(model.timer) { time in
                model.receiveTimerUpdate()
            }
            .padding(.vertical, 50)
        }
        .frame(width: 300, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountdownModel())
    }
}
