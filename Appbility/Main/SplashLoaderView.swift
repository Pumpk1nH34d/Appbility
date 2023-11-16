//
//  ContentView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
//

import SwiftUI

struct SplashLoaderView<Content>: View where Content: View {
    let viewToLoad: Content
    @State private var showSplash = true
    
    var body: some View {
        ZStack{
            if showSplash {
                SplashView()

            } else {
                viewToLoad
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                showSplash = false
            }
            
        }
    }
}

#Preview {
    SplashLoaderView(viewToLoad: LoginView())
}
