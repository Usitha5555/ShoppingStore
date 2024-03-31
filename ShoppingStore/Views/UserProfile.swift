//
//  UserProfile.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-30.
//
import SwiftUI

struct UserProfile: View {
    @State private var isShowingSignOutAlert = false
    @State var username: String
    
    init(username: String) {
            self._username = State(initialValue: username)
        }
    
    var body: some View {
        VStack{
            Image("mount")
                .resizable()
                
                .ignoresSafeArea(.all)
                .frame(height: 300)
                
                
        }
        VStack {
            
            
            // Avatar
            Image("avatar2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
                .padding(.top,-80)
               
            
                
            
            // Name
            Text(username)
                .font(.title)
                .fontWeight(.bold)
                
            Text("Clothes mean nothing until someone")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .opacity(0.5)
            Text("lives in them")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .opacity(0.5)
            Text("all")
            
            
            Spacer()
            
            // Signout Button
            Button(action: {
                // Show signout alert or perform signout action
                isShowingSignOutAlert = true
            }, label: {
                Text("Sign Out")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal,100)
                    .background(Color.black)
                    .cornerRadius(20)
                    .padding(.top,200)
            })
            .alert(isPresented: $isShowingSignOutAlert) {
                Alert(title: Text("Sign Out"), message: Text("Are you sure you want to sign out?"), primaryButton: .destructive(Text("Sign Out")) {
                    // Perform signout action here
                }, secondaryButton: .cancel())
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserProfile(username: "Usitha")
}
