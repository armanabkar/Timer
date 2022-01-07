//
//  CountdownModel.swift
//  Timer
//
//  Created by Arman Abkar on 1/3/22.
//

import SwiftUI
import AVFoundation

final class CountdownModel: ObservableObject {
        
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var counter: CGFloat = 0.0
    @Published var duration: CGFloat = 0.1
    @Published var storedDuration: CGFloat = 0.1
    @Published var selectedHours = 0
    @Published var selectedMinutes = 0
    @Published var selectedSeconds = 0
    @Published var isRunning = false
    @Published var hours = [Int](0...23)
    @Published var minutes = [Int](0...59)
    @Published var seconds = [Int](0...59)
        
    var progress: CGFloat {
        (counter / duration)
    }
    
    var timeFormatter: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: TimeInterval(duration - counter)) ?? "00:00:00"
    }
    
    private var audioPlayer: AVAudioPlayer?
    
    func completed() -> Bool {
        if isRunning && progress == 1 {
            playSound(sound: "radar-sound", type: "mp3")
            DispatchQueue.main.async {
                if let window = NSApplication.shared.windows.last {
                    NSApplication.shared.activate(ignoringOtherApps: true)
                    window.makeKeyAndOrderFront(self)
                }
            }
        }
        return progress == 1
    }
    
    func updateTimer(_ tag: Int) {
        let hours = selectedHours * 3600
        let minutes = selectedMinutes * 60
        let seconds = selectedSeconds
        counter = 0
        duration = CGFloat(hours + minutes + seconds)
    }
    
    func resetTimer() {
        audioPlayer?.stop()
        isRunning = false
        duration = storedDuration
        counter = 0
        selectedHours = 0
        selectedMinutes = 0
        selectedSeconds = 0
    }
    
    func receiveTimerUpdate() {
        if counter < duration && isRunning {
            counter += 1
        } else {
            isRunning = false
            timer.upstream.connect().cancel()
        }
    }
    
    func disabledAction() -> Bool {
        duration == 0.1
    }
    
    func playPauseAction() {
        isRunning.toggle()
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    private func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print(error)
            }
        }
    }

}
