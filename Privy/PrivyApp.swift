//
//  PrivyApp.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/22/24.
//

import SwiftUI

@main
struct PrivyApp: App {
    //decides what flow of application we want to show
    @StateObject var authManager = AuthManager(service: MockAuthService())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
