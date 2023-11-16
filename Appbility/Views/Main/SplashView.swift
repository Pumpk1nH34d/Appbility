//
//  NewSplashView.swift
//  Appbility
//
//  Created by Au?tin on 18/11/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State private var showSplash = true
    @State private var scale = CGSize(width: 10.0, height: 10.0)
    @State private var opacity = 0.0
    
    var body: some View {
        if showSplash {
            _SplashView(showSplash: $showSplash)
        } else {
            LoginView()
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.0)) {
                        opacity = 1
                    }
                    withAnimation(.easeInOut(duration: 1.0)) {
                        scale = CGSize(width: 1.0, height: 1.0)
                    }
                }
        }
    }
}

private struct _SplashView: View {
    @Binding var showSplash: Bool
    
    @State private var scale = CGSize(width: 0.0, height: 0.0)
    @State private var whiteOpacity = 1.0
    
    var body: some View {
        ZStack {
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
                scale = CGSize(width: 1, height: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    scale = CGSize(width: 0.0, height: 0.0)
                    whiteOpacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
