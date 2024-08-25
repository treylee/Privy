//
//  EmailView.swift
//  Privy
//
//  Created by Trieveon Cooper on 8/23/24.
//

import SwiftUI

struct EmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .center, spacing:14) {
                 
                    Text("Email")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(20)
                    
                    Text("Please add your email address")
                        .font(
                            .system(
                                size: 17,
                                weight: .semibold,
                                design: .default
                            ))
                        .foregroundStyle(.gray)
                    
                    TextField("Enter email",text: $email)
                        .textInputAutocapitalization(.never
                        )
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                
                Spacer()
                
                NavigationLink {
                    PasswordView()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width:340,height:50)
                        .background(.purple)
                        .clipShape(Capsule())
                    
                }
                
            }
            .toolbar {
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
}

#Preview {
    EmailView()
}
