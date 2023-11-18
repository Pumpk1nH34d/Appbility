//
//  profilePreviewView.swift
//  Appbility
//
//  Created by Au?tin on 19/11/2023.
//

import SwiftUI

struct ProfileCardView: View {
    @State private var email = getEmail()
    var body: some View {
        VStack {
            HStack {
                Image("ProfilePicture")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading) {
                    Text("Austin Delic")
                        .foregroundColor(.white)
                        .font(Font.custom("Nunito", size: 20))
                        .fontWeight(.bold)
                    Text(email)
                        .foregroundColor(.white)
                        .font(Font.custom("Nunito", size: 15))
                }
            }
            .padding()
            .background(Color("Light Blue").opacity(0.7))
            .cornerRadius(10)
        }
    }
}


#Preview {
    ProfileCardView()
}
