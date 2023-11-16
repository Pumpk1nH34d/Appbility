//
//  SplashView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct SplashView: View {

    @State private var scale = CGSize(width: 1.0, height: 1.0)
    @State private var whiteOpacity = 1.0
    
    var body: some View {
        
        ZStack{
            Color("Dark Blue")
                .ignoresSafeArea(.all)
            Image("Logo")
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
            Color(.white)
                .ignoresSafeArea(.all)
                .opacity(whiteOpacity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                whiteOpacity = 0.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation (.easeInOut(duration: 0.5)){
                    scale = CGSize(width: 0.0, height: 0.0)
                    whiteOpacity = 1.0
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
