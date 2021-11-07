//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by Jonathan Hernandez on 11/2/21.
//

import SwiftUI
import Firebase

@main
struct DesignCodeiOS15App: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            AccountView()
        }
    }
}
