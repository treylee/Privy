//
//  ContentView.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        Group {
            switch authManager.authState {
            case .unauthenticated:
                AuthenticationRootView()
            case .authenticated:
                TempView()
            }
        }
    }
}

#Preview {
    ContentView()
}
