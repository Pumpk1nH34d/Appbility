//
//  VolumeControlView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct VolumeControlView: View {
    @State private var soundLevel: Float = 0.5
    
        var body: some View {
            
            Text("\(Int(round(soundLevel*100)))%")
            
            Slider(value: $soundLevel, in: 0...1,step: 0.0625, onEditingChanged: { data in
               setSystemVolume(soundLevel)
            })
            
        }
}

#Preview {
    VolumeControlView()
}
