//
//  ContentView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack{
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
            } else {
                LoginView()
                    .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
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
