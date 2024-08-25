//
//  PasswordView.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/25/24.
//

import SwiftUI

struct PasswordView: View {
    @State private var email = "test@gmail.com"
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing:14) {
                
                Text("Password")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(20)
                
                Text("Please add your password below")
                    .font(
                        .system(
                            size: 17,
                            weight: .semibold,
                            design: .default
                        ))
                    .foregroundStyle(.gray)
                
                TextField("Enter password",text: $email)
                    .textInputAutocapitalization(.never
                    )
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    .multilineTextAlignment(.center)
                
            }.navigationBarBackButtonHidden()
                .padding()
            
            Spacer()
            
            Button {
                //calls authenticate function
                Task {await authManager.authenticate(withEmail:email, password: password)}
            }label: {
                Text("Next")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(width:340,height:50)
                    .background(.purple)
                    .clipShape(Capsule())
                
            }
        } .toolbar {
            ToolbarItem(placement:.topBarLeading) {
                Button {
                    dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(UIColor.label)) // Adapts to the system text color
                }
            }
        }
    }
}

#Preview {
    PasswordView()
}
