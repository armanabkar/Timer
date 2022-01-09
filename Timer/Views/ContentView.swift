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
                    Button(action: { model.isMuted.toggle() }) {
                        Image(systemName: model.isMuted ? "speaker.slash" : "speaker")
                            .foregroundColor(.white)
                            .font(.title3)
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
                .padding(.top, 5)
                
                Form {
                    Picker("Hours", selection: $model.selectedHours.onChange(model.updateTimer)) {
                        ForEach(model.hours, id: \.self) { hour in
                            Text("\(hour)")
                        }
                    }
                    Picker("Minutes", selection: $model.selectedMinutes.onChange(model.updateTimer)) {
                        ForEach(model.minutes, id: \.self) { minute in
                            Text("\(minute)")
                        }
                    }
                    Picker("Seconds", selection: $model.selectedSeconds.onChange(model.updateTimer)) {
                        ForEach(model.seconds, id: \.self) { second in
                            Text("\(second)")
                        }
                    }
                }
                .padding(.top, 10)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: 200)
            }
            .padding(.horizontal)
            .onReceive(model.timer) { time in
                model.receiveTimerUpdate()
            }
            .padding(.vertical, 25)
        }
        .frame(width: 300, height: 450)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountdownModel())
    }
}
