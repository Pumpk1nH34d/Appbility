//
//  SignUpView.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var surname = ""
    @State private var DOB = ""
    @State private var logged_in = false
    var body: some View {
        NavigationStack{
            ZStack{
                circleBackgroundView()
                VStack{
                    Text("Signup")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    VStack{
                        VStack{
                        InputView(text: $firstName, placeholder: "John", image: "person", isSecureField: false)
                        InputView(text: $surname, placeholder: "Doe", image: "person", isSecureField: false)
                    }
                        .padding()
                        
                        InputView(text: $email, placeholder: "example@email.com", image: "at", isSecureField: false)
                        InputView(text: $password, placeholder: "Password", image: "lock", isSecureField: true)
                        
                    }
                    HStack {
                        Button("Create Account") {
                            createUser(email: email, password: password, firstname: firstName, surname: surname) { success in
                                if success {
                                    print("User creation was successful.")
                                    logged_in = true
                                } else {
                                    print("User creation failed.")
                                }
                            }
                        }
                        Image(systemName: "arrow.right")
                        
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                    
                    NavigationLink{
                        LoginView()
                        .navigationBarHidden(true)
                    } label: {
                        HStack{
                            Text("Already have an account?")
                            Text("Log In")
                                .fontWeight(.bold)
                        }
                            .font(.system(size: 14))
                            
                    }
                    NavigationLink(destination: UserView().navigationBarBackButtonHidden(), isActive: $logged_in) {
                        EmptyView()
                    }
                }
                
            }
        }
    }
}

#Preview {
    SignUpView()
}
