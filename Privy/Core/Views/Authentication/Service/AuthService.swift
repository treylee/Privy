//
//  AuthService.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/25/24.
//

import Foundation

struct AuthService : AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func login(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }
    
    func signOut() {
    }
    
    
}
