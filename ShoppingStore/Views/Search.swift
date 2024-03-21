//
//  Search.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-21.
//

import SwiftUI

struct Search: View {
    @StateObject var productVM : ProductViewModel = ProductViewModel()
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var searchTerm = ""
    
    
    
    init(searchTerm: String) {
            self._searchTerm = State(initialValue: searchTerm)
        }
    var filteredItems: [Items] {
            if searchTerm.isEmpty {
                return productVM.productResults
            } else {
                return productVM.productResults.filter { $0.name.lowercased().contains(searchTerm.lowercased()) }
            }
        }
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    
                    LazyVGrid(columns: self.columns,spacing: 25){
                        
                        ForEach (filteredItems, id: \.id) { products in
                            
                            UserRow(product: products)
                            
                            
                            
                        }
                        .padding([.horizontal,.top])
                    }
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                }
                .navigationTitle("Borwse Items")
                .searchable(text: $searchTerm, prompt: "Search Items")
                    
                    
                }
            }
        }
    
}

//#Preview {
//    Search(searchTerm: )
//}
