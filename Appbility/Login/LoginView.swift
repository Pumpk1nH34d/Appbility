//
//  SplashLoaderView.swift
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
    
    @State private var scale = CGSize(width: 10.0, height: 10.0)
    @State private var opacity = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Dark Blue")
                    .ignoresSafeArea(.all)
                ZStack{
                    circleBackgroundView()
                    
                    VStack {
                        Text("Login")
                            .font(Font.custom("Nunito", size: 40))
                            .bold()
                            .foregroundColor(Color("Dark Blue"))
                            .padding()
                        
                        VStack{
                            InputView(text: $email, placeholder: "example@email.com", image: "at", isSecureField: false)
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
                            .font(Font.custom("Nunito", size: 20))
                            .bold()
                            
                            Image(systemName: "arrow.right")
                                .bold()
                            
                        }.foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("Dark Blue"))
                            .cornerRadius(10)
                            .padding()
                        
                        NavigationLink(destination: SignUpView().navigationBarHidden(true)){
                            HStack{
                                Text("Don't have an account?")
                                Text("Sign Up")
                                    .fontWeight(.bold)
                            }
                            .font(Font.custom("Nunito", size: 14))
                            .foregroundColor(Color("Dark Blue"))
                            
                        }
                        NavigationLink(destination: UserView().navigationBarBackButtonHidden(), isActive: $logged_in) {
                            EmptyView()
                        }
                    }.opacity(opacity)
                    
                }
                .scaleEffect(scale)
                
                .onAppear{
                    withAnimation(.easeInOut(duration: 0.5)) {
                        opacity = 1
                    }
                    withAnimation(.easeInOut(duration: 1.0)) {
                        scale = CGSize(width: 1.0, height: 1.0)
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


