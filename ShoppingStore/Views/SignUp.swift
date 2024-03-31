//
//  SignUp.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-23.
//

import SwiftUI


struct SignUp: View {
    @StateObject var regVM : RegisterViewModel = RegisterViewModel()
    @State private var showHomeView = false
    @State private var showLoginView = false
    
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
                        Text("Signup").bold().frame(maxWidth: .infinity, alignment: .leading).padding(10)
                            .font(.title)
                            .padding(.horizontal,8)
                        
                        
                        
                        //                        Text("Sign in to continue..")
                        MyInputField(inputField: $regVM.username, fieldName: "Username")
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .padding()
                            .foregroundColor(.gray.opacity(0.4))
                            .overlay{
                                SecureField("Enter a password", text: $regVM.password)
                                    .padding(.leading, 40)
                                    .textInputAutocapitalization(.never)
                            }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .padding()
                            .foregroundColor(.gray.opacity(0.4))
                            .overlay{
                                SecureField("Confirm password", text: $regVM.repassword)
                                    .padding(.leading, 40)
                                    .textInputAutocapitalization(.never)
                            }
                        
                        
                    }
                    .offset(y:-70)
                    .padding(.horizontal,7)
                    
                    
                    
                    Button(action: {
                        regVM.validateUser {
                            if regVM.success {
                                // Navigate to the home view upon successful registration
                                showHomeView = true
                            }}
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 14)
                            .tint(.black)
                            .frame(height: 50)
                            .padding(10)
                            .overlay{
                                Text("Sign Up")
                                    .foregroundColor(.white)
                            }
                    }).padding(.top,2)
                        .offset(y:-40)
                    
                    
                    HStack{
                        
                        Text("Already have an account ?")
                        Button(action: {
                            
                            showLoginView = true
                        }, label: {
                            
                            Text("Sign in")
                                .foregroundColor(.blue)
                            
                        })
                        
                    }.offset(y:-45)
                    
                }
                .offset(y:-100)
                .padding()
                Spacer()
                if regVM.showError {
                    
                    Text(regVM.errorMessage)
                        .foregroundStyle(.black)
                        .bold()
                        .offset(y: -300)
                    
                    
                }
                Spacer()
                NavigationLink(destination: Login(), isActive: $showHomeView) {
                    EmptyView()
                

                
            }.padding(.vertical,10)
                
            NavigationLink(destination: Login(), isActive: $showLoginView) {
                    EmptyView()
                

                
            }.padding(.vertical,10)
            
            
            
            
            
        }
        }.navigationBarBackButtonHidden(true)
        
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
}


#Preview {
    SignUp()
}
