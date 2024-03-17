//
//  DetailView.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let product: Items
    var body: some View {
        //Text(product.name)
        NavigationView{
            ZStack{
                Color(.white)
                ScrollView{
                    VStack{
                        AnimatedImage(url: URL(string: product.image))
                            .resizable()
                            
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 450, alignment: .top)
                            
                            
                            
                            
                            
                        
                    }
                    .cornerRadius(40)
                    .offset(y:-92)
                    
                }
                    
                        
                
                
                
                
                
            }
            
            
                
            
        }
            
                
        
    }
}

