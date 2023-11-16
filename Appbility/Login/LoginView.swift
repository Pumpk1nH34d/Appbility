//
//  ContentView.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var logged_in = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                circleBackgroundView()
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()


                        .foregroundColor(.black)
                        .padding()
                    
                    VStack{
                        InputView(text: $email, placeholder: "example@email.com", image: "at", isSecureField: false)

                        InputView(text: $password, placeholder: "abc123", image: "lock", isSecureField: true)
                        InputView(text: $password, placeholder: "Password", image: "lock", isSecureField: true)
                    }
                    
                    HStack {
                        Button("Login") {
                            authenticateUser(email: email, password: password) { authResult in
                                if let result = authResult {
                                    wrongPassword=0
                                    wrongEmail=0
                                    logged_in = true
                                    print("User is authenticated, user ID: \(result.user.uid)")
                                } else {
                                    wrongPassword=2
                                    wrongEmail=2
                                }
                            }
                        }
                        Image(systemName: "arrow.right")
                        
                    }.foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                    
                    
                    
                    NavigationLink(destination: SignUpView().navigationBarHidden(true)){
                        HStack{
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        
                    }
                    NavigationLink(destination: UserView().navigationBarBackButtonHidden(), isActive: $logged_in) {
                        EmptyView()
                    }
                }
                
            }
        }.navigationBarHidden(true)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


