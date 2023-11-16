//
//  SplashScreenView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color("Dark Blue")
                .ignoresSafeArea(.all)
            Image("Logo")
                .resizable()
                .scaledToFit()
        }.onAppear {
            
        }
    }
}

#Preview {
    SplashScreenView()
}
