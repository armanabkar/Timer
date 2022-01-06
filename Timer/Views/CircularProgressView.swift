//
//  CircularProgressView.swift
//  Timer
//
//  Created by Arman Abkar on 1/3/22.
//

import SwiftUI
import AVFoundation

struct CircularProgressView: View {
    
    @AppStorage("SelectedSystemSound") private var sound: SystemSounds.ID = 1005
    @EnvironmentObject private var model: CountdownModel
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 210, height: 210)
            .overlay(Circle().stroke(lineWidth: 8))
            .foregroundColor(.white)
            .overlay(overlayCircle)
    }
    
    private var overlayCircle: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 210, height: 210)
            .overlay(
                Circle()
                    .trim(from: 0, to: model.progress)
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin:.round))
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(Color(model.completed(with: sound) ? .systemGreen : .systemOrange))
                    .animation(.easeInOut(duration: 0.2))
            )
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
            .environmentObject(CountdownModel())
    }
}
