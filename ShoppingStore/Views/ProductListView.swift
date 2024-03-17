//
//  ProductListView.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-17.
//

import SwiftUI


struct ProductListView: View {
    
    @StateObject var productVM : ProductViewModel = ProductViewModel()
    var body: some View {
        VStack{
            Text("Products").font(.largeTitle)
                .bold().padding(.horizontal)
            
            
            ScrollView {
                ForEach (productVM.productResults, id: \.id) { products in
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 120)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        
                        HStack{
                            
                            
                            Text(products.name)
                            
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    Spacer()
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            
            
        }
        
    }
}

#Preview {
    ProductListView()
}

