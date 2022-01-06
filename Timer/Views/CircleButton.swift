//
//  CircleButton.swift
//  Timer
//
//  Created by Arman Abkar on 1/3/22.
//

import SwiftUI

struct CircleButton: View {
    
    enum ButtonStyle {
        case start
        case pause
        case reset
        
        var title: String {
            switch self {
                case .start:
                    return "Start"
                case .pause:
                    return "Pause"
                case .reset:
                    return "Reset"
            }
        }
        
        var fillColor: Color {
            switch self {
                case .start:
                    return Color(.systemGreen)
                case .pause:
                    return Color(.systemOrange)
                case .reset:
                    return Color(.systemGray)
            }
        }
        
        var foregroundColor: Color {
            switch self {
                case .start:
                    return Color(.white)
                case .pause:
                    return Color(.white)
                case .reset:
                    return Color(.white)
            }
        }
    }
    
    var style: ButtonStyle
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style.fillColor, lineWidth: 1)
                .frame(width: 60, height: 60)
            
            Circle()
                .fill(style.fillColor)
                .frame(width: 55, height: 55)
                .overlay(
                    Text(style.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(style.foregroundColor)
                )
        }
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(style: .reset)
    }
}
