//
//  ClockView.swift
//  Timer
//
//  Created by Arman Abkar on 1/3/22.
//

import SwiftUI

struct ClockView: View {
    
    @EnvironmentObject private var model: CountdownModel
    
    var body: some View {
        VStack {
            Text(model.timeFormatter)
                .foregroundColor(.white)
                .font(.system(size: 66, weight: .bold, design: .default))
                .fontWeight(.bold)
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .environmentObject(CountdownModel())
    }
}
