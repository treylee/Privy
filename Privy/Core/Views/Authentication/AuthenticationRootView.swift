//
//  AuthenticationRootView.swift
//  Garden
//
//  Created by Trieveon Cooper on 8/22/24.
//

import SwiftUI

struct AuthenticationRootView: View {
    @State private var showAuthFlow = false
    @EnvironmentObject var authManager: AuthManager
    var body: some View {
        NavigationStack {
            VStack {
                Text(
                    "Privy"
                ).foregroundColor(
                    .white
                )
                .font(
                    .system(
                        size: 50,
                        weight: .light,
                        design: .default
                    )
                )
                .bold().scaledToFit().padding(100)
                
                VStack(
                    spacing: 8
                ) {
                    Text(
                        "Thoughts of the "
                    ).foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 25,
                            weight: .heavy
                            ,
                            design: .default
                        ))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .bold()
                    
                    +                    Text(
                        "Heart"
                    ).foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 26,
                            weight: .heavy,
                            design: .default
                        ))
                    Text(
                        "Can't "
                    ).foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 26,
                            weight: .heavy,
                            design: .default
                        )) +
                    
                    Text(
                        "be"
                    ).foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 25,
                            weight: .heavy,
                            design: .default
                        ))
                    
                    Text(
                        "kept "
                    ).bold().foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 25,
                            weight: .semibold,
                            design: .default
                        )) +
                    
                    Text(
                        "Secret"
                    ).foregroundColor(
                        .white
                    )
                    .font(
                        .system(
                            size: 26,
                            weight: .heavy,
                            design: .default
                        ))
                }
                
                Spacer()
                
                VStack(
                    spacing: 20
                ) {
                    Button {
                        showAuthFlow.toggle()
                        authManager.authType = .craeteAccount
                    } label: {
                        Text(
                            "Create Account"
                        )
                        .font(
                            .headline
                        )
                        
                        .foregroundStyle(
                            .black
                        )
                        .frame(
                            width: 340,
                            height: 50
                        )
                        .background(
                            .white
                        )
                        .clipShape(
                            Capsule()
                        )
                    }
                    
                    Button {
                        showAuthFlow.toggle()
                        authManager.authType = .login
                    } label: {
                        Text(
                            "Sign In"
                        )
                        .font(
                            .headline
                        )
                        .foregroundStyle(
                            .white
                        )
                        .frame(
                            width: 340,
                            height: 50
                        )
                    }
                    .overlay {
                        Capsule().stroke(
                            Color.white,
                            lineWidth: 1.5
                        )
                    }
                    NavigationLink {
                        Text("forgeot PW")
                    } label: {
                        Text(
                            "Trouble signing in?"
                        )
                        .font(
                            .headline
                        )
                        .foregroundStyle(
                            .white
                        )
                        .padding()
                    }
                    Text(
                        "By Tapping 'Sign in' you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy"
                    )
                    .multilineTextAlignment(.center )
                    .foregroundColor(.white)
                    .font(.footnote)
                }
            }
            // this prevnts you from making two seperate flows
            .fullScreenCover(item: $authManager.authType) { type in EmailView()
            }
            .frame(maxWidth: .infinity)
            .background(
                gradientBackground
            )
        }
    }
}

private extension AuthenticationRootView {
    var gradientBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(
                    .blue
                ),
                Color(
                    .systemPurple
                ),
                Color(
                    .systemIndigo
                ),
            ],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )
    }
}

#Preview {
    AuthenticationRootView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
