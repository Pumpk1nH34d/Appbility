//
//  AppbilityApp.swift
//  Appbility
//
//  Created by Au?tin on 13/11/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct AppbilityApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var deligate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions  launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
        FirebaseApp.configure()
        print("Connected Firebase")

        return true
    }
}
