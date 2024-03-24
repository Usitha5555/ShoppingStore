//
//  Cart.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-19.
//

import SwiftUI
import SDWebImageSwiftUI


struct Cart: View {
    @State var totalPrice = 0.00
    @State var subTotal = 0.0
    @State var shipping = 0.0
    @State var totalWithShipping = 0.0
    @State private var showAlert = false
    var body: some View {
                VStack{
                    Text("Cart")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .frame(width: 360, alignment: .leading)
        
        
        
                }
        
        
        NavigationView {
            List{
                ForEach(cartItems, id: \.cartId) { item in
                    HStack {
                        
                        
                        AnimatedImage(url: URL(string: item.imageURL))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 60)
                            
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Price: \(String(format: "%.2f", item.price))")
                            Text("Quantity: \(item.quantity)")
                            Text("Size:\(item.size)")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 8)
                        .background(Color.white)
                    }
                    .background(Color.white)
                    .padding(.vertical, 5)
                }
                .onDelete(perform: deleteItem)
                    
                
            }.background(Color.white)
            
            
            
            
        }.background(Color.white)
        Divider()
        
        ZStack{
            VStack{
                HStack{
                    Text("Sub total")
                        
                    Spacer()
                    Text("LKR \(String(format: "%.2f", subTotal))")
                }.padding()
                
                HStack{
                    Text("Shipping")
                    Spacer()
                    Text("LKR \(String(format: "%.2f", shipping))")
                        
                }.padding()
                
                HStack{
                    Text("Total")
                        .font(.title2)
                        .fontWeight(.bold)
                        .font(.system(size: 44,design: .rounded))
                    Spacer()
                    
                    Text("LKR \(String(format: "%.2f", totalWithShipping))")
                        .font(.title)
                        .fontWeight(.bold)
                        .font(.system(size: 44,design: .rounded))
                        .foregroundColor(.red)
                        
                }.padding()
                    
                
                
            }.padding(.bottom,50)
                .padding(.horizontal,12)
            VStack{
                HStack{
                    
                    HStack{
                        
                    }
                    Spacer()
                    
                    Button(action: {
                        
                        showAlert = true
                        
                    }, label: {
                        
                        Text("Buy Now")
                        
                    })
                    .padding()
                    .padding(.horizontal,100)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .alert(isPresented: $showAlert) {
                                    Alert(title: Text("Success"), message: Text("Purchase Successful"), dismissButton: .default(Text("OK")))
                                }
                
                    Spacer()
                    
                    HStack{}
                    
                }
                .background(Color.white)
                
                
                    
            }
            
            .frame(maxHeight: .infinity,alignment: .bottom)
                
            
            
            
        }.onAppear(perform: calculateTotalPrice)
    }
    
//    func calculateTotalPrice() {
//            totalPrice = 0.0
//            let shipping = 300.00
//            for item in cartItems {
//                let itemPrice = Double(item.price) 
//                totalPrice += itemPrice * Double(item.quantity)
//            }
//        }
            
    
    func calculateTotalPrice() {
            subTotal = 0.0
            for item in cartItems {
                let itemPrice = Double(item.price) 
                subTotal += itemPrice * Double(item.quantity)
            }

            shipping = subTotal > 0 ? 300.0 : 0.0 // Shipping cost is 300 if subtotal > 0, else 0
            totalWithShipping = subTotal + shipping
        }
            
        
    
    func deleteItem(at offsets: IndexSet) {
            cartItems.remove(atOffsets: offsets)
            calculateTotalPrice()
        }
    
    
}

#Preview {
    Cart()
}
