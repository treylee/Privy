//
//  AuthServiceProtocol.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/25/24.
//

import Foundation

protocol AuthServiceProtocol {
    
    func createUser(withEmail email: String, password: String) async throws -> String
    func login(withEmail email: String, password: String) async throws -> String
    func signOut()
}
