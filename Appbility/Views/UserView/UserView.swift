//
//  UserView.swift
//  Appbility
//
//  Created by Au?tin on 14/11/2023.
//

import SwiftUI
import FirebaseAuth

struct UserView: View {
    @State private var email: String = getUserEmail()
    
    var body: some View {
        Text("userId: \(email)").onAppear{
            print("userId: \(email)")
        }
        
    }
}


#Preview {
    UserView()
}
