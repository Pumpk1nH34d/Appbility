//
//  ContentView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var opacity = 0.5
    @State private var scale = 1.0
    var body: some View {
        ZStack{
            if showSplash {
                SplashScreenView()
                    .scaleEffect(scale)
                    
                    
                
            } else {
                LoginView()
                    .transition(.scale(10))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
