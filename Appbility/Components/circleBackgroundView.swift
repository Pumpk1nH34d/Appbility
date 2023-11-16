//
//  Components.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI

struct circleBackgroundView: View {
    var body: some View {
        ZStack{
            Color("Dark Blue")
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
        }
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        circleBackgroundView()
    }
}
