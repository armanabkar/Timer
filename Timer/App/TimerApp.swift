//
//  TimerApp.swift
//  Timer
//
//  Created by Arman Abkar on 1/2/22.
//

import SwiftUI

@main
struct TimerApp: App {
    
    @StateObject private var model = CountdownModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
