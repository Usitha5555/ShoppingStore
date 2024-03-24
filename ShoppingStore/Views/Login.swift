//
//  Login.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-21.
//

import SwiftUI

struct Login: View {
    @StateObject var homeVM : LoginViewModal = LoginViewModal()
    @State var success = false
        
    var body: some View {
        NavigationView {
            
            VStack {
                VStack{
                    HStack{
                        Image("hf")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .cornerRadius(50)
                                                .frame(width: 400,height: 400)
                                                .offset(y:-40)
                                                
                        
                    }
                    
                    HStack{
                        Image("Logo")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80,height: 80)
                                                .offset(y:-70)
                                                
                    }
                    
                    VStack{
                        Text("SignIn").bold().frame(maxWidth: .infinity, alignment: .leading).padding(10)
                                                    .font(.title)
                                                    .padding(.horizontal,8)
                                                    
                                                    
                                                    
                        //                        Text("Sign in to continue..")
                                                MyInputField(inputField: $homeVM.username, fieldName: "Username")
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(height: 50)
                                                    .padding()
                                                    .foregroundColor(.gray.opacity(0.4))
                                                    .overlay{
                                                        SecureField("Enter a password", text: $homeVM.password)
                                                            .padding(.leading, 40)
                                                            .textInputAutocapitalization(.never)
                                                    }
                    }
                    .offset(y:-50)
                    .padding(.horizontal,8)
                    
                    
                    
                    Button(action: {
                        homeVM.validateUser {
                            if homeVM.success {
                                // Navigate to the next view upon successful login
                                success = true
                            } else {
                                // Show an error alert or message
                                // For example:
                                // showAlert = true
                            }
                        }
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 14)
                            .tint(.black)
                            .frame(height: 50)
                            .padding(10)
                            .overlay{
                                Text("Sign Up")
                                    .foregroundColor(.white)
                            }
                    })
                    
                    Divider()
                    HStack{
                        
                        Text("Dont have an account ?")
                        Button(action: {
                            
                            
                        }, label: {
                            
                                    Text("Sign Up")
                                        .foregroundColor(.blue)
                                
                        })
                        
                    }
                    
                }
                .offset(y:-70)
                .padding()
                Spacer()
                if homeVM.showError {
                    
                            Text(homeVM.errorMessage)
                                .foregroundStyle(.black)
                                .bold()
                                .offset(y: -100)
                                
                        
                }
                Spacer()
                NavigationLink(destination: HomeView(), isActive: $success) {
                                    EmptyView()
                                }
                
            }.padding(.vertical,100)
            
            
            
            
        }
            
        }
    }

struct MyInputField : View {
    
    @Binding var inputField : String
    var fieldName : String = ""
    var body: some View{
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 50)
            .padding()
            .foregroundColor(.gray.opacity(0.4))
            .overlay{
                TextField(fieldName, text: $inputField)
                    .padding(.leading, 40)
                    .textInputAutocapitalization(.never)
            }
    }
}

#Preview {
    Login()
}
