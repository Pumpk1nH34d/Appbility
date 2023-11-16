//
//  InputView.swift
//  Appbility
//
//  Created by Au?tin on 16/11/2023.
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
                    .font(Font.custom("Nunito", size: 15))
            } else {
                
                TextField(placeholder, text: $text)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .font(Font.custom("Nunito", size: 15))
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), placeholder: "Enter your email", image: "at", isSecureField: false)
}
