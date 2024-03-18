//
//  DetailView.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-17.
//

import SwiftUI
import SDWebImageSwiftUI




struct DetailView: View {
    
    @State var selectedSize: String = "M"
    let sizes = ["XS", "S", "M", "L", "XL"]
    let product: Items
    var body: some View {
        
        
        
        //Text(product.name)
        VStack{
            
            ZStack{
                ScrollView{
                    Color(.white)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack(alignment: .leading){
                        AnimatedImage(url: URL(string: product.image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(40)
                            .frame(width: 400,height: 400)
                            .clipped()
                            
                        
                        
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(product.category+""+product.name)
                                    .opacity(0.5)
                                    .font(.subheadline)
                                Text(product.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                
                                
                            }
                            .padding()
                            .background(Color.white)
                            Spacer()
                            
                            VStack{
                                ZStack {
                                    
                                    //output   white
                                    
                                    Circle()
                                        .fill(Color.black) // Black circle
                                        .frame(width: 15, height: 15) // Adjust size as needed
                                    
                                    Circle()
                                        .stroke(Color.black, lineWidth: 2) // Circle ring with the same color
                                        .frame(width: 25, height: 25) // Adjust size as needed
                                }
                                .padding(.horizontal, 20)
                                
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                            
                        HStack {
                                Spacer()
                                HStack(spacing: 10) {
                                    ForEach(sizes, id: \.self) { size in
                                        Button(action: {
                                            selectedSize = size
                                            print(selectedSize)
                                        }) {
                                            Text(size)
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(selectedSize == size ? .white : .black)
                                                .padding(.all, 10)
                                                .background(selectedSize == size ? Color.black : Color.white)
                                                .cornerRadius(8)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(Color.black, lineWidth: selectedSize != size ? 2 : 0)
                                                )
                                                .font(.subheadline)
                                        }
                                        
                                    }
                                }
                                .padding(.horizontal, 50)
                                Spacer()
                            }
                        .padding(.top,40)
                    
                        HStack{
                            VStack(alignment: .leading){
//                                HStack{
//                                    Text("Quantity")
//                                        .fontWeight(.bold)
//                                        .font(.subheadline)
//                                        .opacity(0.5)
//                                    Spacer()
//                                    Text("Price")
//                                        .fontWeight(.medium)
//                                        .font(.subheadline)
//                                        .opacity(0.5)
//                                }.padding(.horizontal)
                                
                                
                                HStack{
                                    
                                    Button(action: {}){
                                        Image(systemName: "minus")
                                            .padding(.all,8)
                                    }
                                    .frame(width: 30,height: 30)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                    .foregroundStyle(.black)
                                    
                                    
                                    Text("1")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 8)
                                    
                                    Button(action: {}){
                                        Image(systemName: "plus")
                                            .padding(.all,8)
                                    }
                                    .frame(width: 30,height: 30)
                                    .background(Color(.black))
                                    .clipShape(Circle())
                                    .foregroundStyle(.white)
                                    
                                    Spacer()
                                    Text("LKR 1999")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        
                                }.padding(.horizontal)
                            }.padding(.vertical,50)
                            
                        }
                        
                        
                        
                            VStack(alignment: .leading){
                                Text("Description")
                                Text(product.description)
                                    .opacity(0.8)
                                    .font(.subheadline)
                            }.padding(.horizontal)
                        
                                                
                        
                    }
                    
                    .padding(.top, -30)
//                    .padding()
                    .padding(.bottom,150)
                    
                    

                }
                
                HStack{
                    HStack{
                        
                    }
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        Text("Add to Cart")
                    })
                    .padding()
                    .padding(.horizontal,100)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    Spacer()
                    
                    HStack{}
                    
                }
                .background(Color.white)
                .frame(maxHeight: .infinity,alignment: .bottom)
                
                

                
                
                
            }
                        
            
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
        
    
    
}



