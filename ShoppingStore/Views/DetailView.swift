//
//  DetailView.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-17.
//

import SwiftUI
import SDWebImageSwiftUI




struct DetailView: View {
    
    @State private var quantity = 1
    @State var selectedSize: String = "M"
    @State var goTOCart = false
    let sizes = ["XS", "S", "M", "L", "XL"]
    @State private var showAlert = false
    let product: Items
    
    var body: some View {
    
    var totalPrice: Double {
        if let priceValue = Double(product.price) {
            return priceValue * Double(quantity)
        } else {
            return 0 // or handle the error condition as needed
        }
    }
        
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
                                Text(product.category+" "+product.name)
                                    .opacity(0.5)
                                    .font(.subheadline)
                                Text(product.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Colour : "+product.color)
                                
                                
                                
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
                                
                                
                                HStack{
                                    
                                    Button(action: {
                                        if quantity > 1 {
                                                quantity -= 1
                                        }
                                        
                                    }){
                                        Image(systemName: "minus")
                                            .padding(.all,8)
                                    }
                                    .frame(width: 30,height: 30)
                                    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                    .foregroundStyle(.black)
                                    
                                    
                                    Text("\(quantity)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 8)
                                    
                                    Button(action: {
                                        quantity += 1
                                    }){
                                        Image(systemName: "plus")
                                            .padding(.all,8)
                                    }
                                    .frame(width: 30,height: 30)
                                    .background(Color(.black))
                                    .clipShape(Circle())
                                    .foregroundStyle(.white)
                                    
                                    Spacer()
                                    
                                    
                                    Text("LKR \(totalPrice, specifier: "%.2f")")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        
                                }.padding(.horizontal)
                            }.padding(.vertical,50)
                            
                        }
                        
                        
                        
                            VStack(alignment: .leading){
                                Text("Description")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.bottom,10)
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
                    
                    Button(action: {
                        goTOCart = true
                        let newItem = CartItem(cartId: UUID(),pid: product.id, name: product.name, price: totalPrice, quantity: quantity, imageURL: product.image,size: selectedSize,eachPrice: product.price)
                            
                            // Append the new item to the cartItems array
                            cartItems.append(newItem)
                            showAlert = true
                            print("appended")

                        
                    }, label: {
                        
                        Text("Add to Cart")
                        
                    })
                    .padding()
                    .padding(.horizontal,100)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Success"), message: Text("Item added to cart successfully"), dismissButton: .default(Text("OK")))
                                }
                    Spacer()
                    
                    HStack{}
                    
                }
                .background(Color.white)
                .frame(maxHeight: .infinity,alignment: .bottom)
                
                

                
                
                
            }
                        
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: goTOCart) { newValue in
                    if newValue {
                        // Reset values when item is added to cart
                        quantity = 1
                        selectedSize = "M"
                        goTOCart = false // Reset the trigger
                    }
                }
       
        
        
    }
        
    
    
}



