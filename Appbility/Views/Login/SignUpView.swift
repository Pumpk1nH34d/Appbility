//
//  SignUpView.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI




struct SignUpView: View {
    @State private var currentView = 1
    
    var body: some View {
        ZStack {
            circleBackgroundView()
            switch currentView{
            case 0:
                LoginView()
            case 1:
                _SignUpView(currentView: $currentView)
            default:
                UserView()
                    .transition(.slide)
            }
        }.transition(.opacity)
    }
}

private struct _SignUpView: View {
    @Binding var currentView: Int
    
    
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var surname = ""
    @State private var DOB = ""
    
    var body: some View {
        ZStack{
            circleBackgroundView()
            VStack{
                Text("Signup")
                    .font(Font.custom("Nunito", size: 40))
                    .bold()
                    .foregroundColor(Color("Light Blue"))
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
                
                Button {
                    createUser(email: email, password: password, firstname: firstName, surname: surname) { success, error in
                        if success {
                            print("User creation was successful.")
                            withAnimation {
                                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                                currentView = 2 // Navigate to UserView if the user is successfully created.
                            }
                        } else {
                            if let error = error {
                                print("User creation failed with error: \(error.localizedDescription)")
                            } else {
                                print("User creation failed due to unknown error.")
                            }
                        }
                    }
                }label: {
                    Text("Create Account")
                        .font(Font.custom("Nunito", size: 20))
                        .bold()
                    Image(systemName: "arrow.right")
                        .bold()
                }.foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("Light Blue"))
                    .cornerRadius(10)
                    .padding()
                
                Button{
                    withAnimation{
                        currentView = 0
                    }
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Log In")
                            .fontWeight(.bold)
                    }
                    .font(Font.custom("Nunito", size: 14))
                    .foregroundColor(Color("Light Blue"))
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}

