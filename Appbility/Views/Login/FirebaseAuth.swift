//
//  FirebaseAuth.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



func authenticateUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        DispatchQueue.main.async {
            if (authResult?.user) != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}

func createUser(email: String, password: String, firstname: String, surname: String, completion: @escaping (Bool, Error?) -> Void) {
    let db = Firestore.firestore()
    
    // Create a new user with email and password
    Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
        if let error = error {
            print("Error creating user: \(error.localizedDescription)")
            completion(false, error)
            return
        }
        
        // Check if the user creation was successful and a user is returned
        guard let user = authResult?.user else {
            print("Error: User was not created.")
            completion(false, nil)
            return
        }
        
        // User is created, now add additional details to Firestore
        db.collection("users").document(user.uid).setData([
            "firstname": firstname,
            "lastname": surname,
            "email": email
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
                completion(false, err)
            } else {
                print("Document successfully written!")
                completion(true, nil)
            }
        }
    }
}

func signOut() {
    do {
        try Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    } catch {
        // Handle the error if sign out fails
        print("error signing out.")
    }
}
func getEmail() -> String{
    return Auth.auth().currentUser?.email ?? "error"
}
