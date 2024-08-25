//
//  AuthManager.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/25/24.
//

import Foundation

enum AuthType: Int,Identifiable {
    case craeteAccount
    case login
    
    var id: Int { return self.rawValue}
}

enum AuthState{
    case unauthenticated
    case authenticated(String)
}
class AuthManager: ObservableObject {
    @Published var authType: AuthType?
    @Published var authState: AuthState =  .unauthenticated
    private let service: AuthServiceProtocol
    
    //dependcing injection and inversion similar to private final
    init(service: AuthServiceProtocol){
        self.service = service
    }
    // checks the state of the variables and does accordingly and updated the root view tracking these variables
    func authenticate(withEmail email: String, password: String) async {
        guard let authType else {return}
        
        do {
            switch authType {
            case .craeteAccount:
                let uid = try await service.createUser(withEmail: email, password: password)
                self.authState = .authenticated(uid)
            case .login:
                let uid = try await service.login(withEmail:  email, password: password)
                self.authState = .authenticated(uid)
        }
        } catch {
            print("debug: failed to auth with \(error)")
        }
    }
}
