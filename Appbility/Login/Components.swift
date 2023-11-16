//
//  Components.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let placeholder: String
    let image: String
    let isSecureField: Bool
    
    var body: some View {
        HStack {
            Image(systemName: image)
            if isSecureField {
                
                SecureField(placeholder, text: $text)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            } else {
                
                TextField(placeholder, text: $text)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
            }
        }
    }
}

struct circleBackgroundView: View {
    var body: some View {
        ZStack{
            Color.blue
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
        ZStack{
            circleBackgroundView()
            InputView(text: .constant(""), placeholder: "Enter your email", image: "at", isSecureField: false)
        }
    }
}
