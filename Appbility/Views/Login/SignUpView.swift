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
                        .font(Font.custom("Nunito", size: 40))
                        .bold()
                        .foregroundColor(Color("Dark Blue"))
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
                    
                    Button() {
                        createUser(email: email, password: password, firstname: firstName, surname: surname) { success in
                            if success {
                                print("User creation was successful.")
                                logged_in = true
                            } else {
                                print("User creation failed.")
                            }
                        }
                    } label: {
                        Text("Create Account")
                            .font(Font.custom("Nunito", size: 20))
                            .bold()
                        Image(systemName: "arrow.right")
                            .bold()
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color("Dark Blue"))
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
                        .font(Font.custom("Nunito", size: 14))
                        .foregroundColor(Color("Dark Blue"))
                    }
                }
            }.onAppear{
                
                withAnimation(.easeInOut(duration: 1.0)) {
                    print("sign up")
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}

