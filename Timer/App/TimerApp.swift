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
                .onAppear {
                    DispatchQueue.main.async {
                        if let window = NSApplication.shared.windows.last {
                            window.styleMask.remove(.fullScreen)
                            window.standardWindowButton(NSWindow.ButtonType.zoomButton)?.isHidden = true
                        }
                    }
                }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .commands {
            CommandGroup(replacing: .appInfo) {
                Button("About Timer") {
                    NSApplication.shared.orderFrontStandardAboutPanel(
                        options: [
                            NSApplication.AboutPanelOptionKey.credits: NSAttributedString(
                                string: "Timer application for macOS.",
                                attributes: [
                                    NSAttributedString.Key.font: NSFont.boldSystemFont(
                                        ofSize: NSFont.smallSystemFontSize)
                                ]
                            ),
                            NSApplication.AboutPanelOptionKey(rawValue: "Copyright"): "© 2022 Arman Abkar"]
                    )
                }
                Link("Source Code",
                     destination: URL(string: "https://github.com/armanabkar/Timer")!)

            }
        }
    }
}
