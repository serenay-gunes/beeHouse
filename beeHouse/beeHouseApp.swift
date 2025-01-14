//
//  beeHouseApp.swift
//  beeHouse
//
//  Created by Serenay Güneş on 17.11.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct beeHouseApp: App {
    
    // register app delegate for Firebase setup
    // AppDelegate'i bağlama
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RegisterView()
        }
    }
}
