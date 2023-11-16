//
//  VolumeControl.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import Foundation
import MediaPlayer

func setSystemVolume(_ volume: Float) -> Void {
    let volumeView = MPVolumeView()
    let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
        slider?.value = volume
    }
}

func getSystemVolume(){
    let audioSession = AVAudioSession.sharedInstance()
    do {
        try audioSession.setActive(true)
        let currentVolume = audioSession.outputVolume
        print("System Volume Level: \(currentVolume)")
    } catch {
        print("Error setting up audio session: \(error.localizedDescription)")
    }
}
