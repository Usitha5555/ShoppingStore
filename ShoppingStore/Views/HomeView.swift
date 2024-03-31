//
//  HomeView.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-11.
//

import SwiftUI

struct HomeView: View {
    @State var goTOCart = false
    @State var goToSearch = false
    @State var goToProfile = false
    @State private var searchText: String = ""
    @State var isSearchActive = false
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @StateObject var productVM : ProductViewModel = ProductViewModel()
    @State var selected = tabs[0]
    @State var username: String
    
    init(username: String) {
            self._username = State(initialValue: username)
        }
    
    var filteredProducts: [Items] {
        let lowercaseSelected = selected.lowercased() 
        
        if lowercaseSelected == "all" {
            return productVM.productResults
        } else {
            let filtered = productVM.productResults.filter { $0.category.lowercased() == lowercaseSelected }
            filtered.forEach { item in
                print(item.category)
                print(username)
            }
            return filtered
        }
    }

    @Namespace var animation
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ScrollView{
                    VStack(alignment:.leading){
                        AppBarView()
                        
                        TagLine()
                            .padding(.horizontal)
                            .padding(.vertical)
                        Searchhome()
                        Banner()
                        HStack(spacing:0){
                            ForEach(tabs,id:\.self){tab in
                                
                                //tab button
                                TabButton(title: tab, selected: $selected, animation: animation)
                                
                                //space between
                                if tabs.last != tab{Spacer(minLength: 0)}
                            }
                            
                        }
                        .padding(.horizontal,35)
                        
                        
                        
                        
                        
                        LazyVGrid(columns: self.columns,spacing: 25){
                            
                            ForEach (filteredProducts, id: \.id) { products in
                                
                                UserRow(product: products)
                                
                                
                                
                            }
                            .padding([.horizontal,.top])
                        }
                        .background(Color.white.edgesIgnoringSafeArea(.all))
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                HStack{
                    BottomNavBarItem(image: Image("searchMenu")){
                        goToSearch = true
                        isSearchActive = true
                        
                    }
//                    BottomNavBarItem(image: Image("fav")){}
                    BottomNavBarItem(image: Image("cart")){
                        goTOCart = true
                        
                        
                        
                    }
                    BottomNavBarItem(image: Image("account")){
                        goToProfile = true
                    }
                }
                .padding(14)
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.15), radius: 8,x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                NavigationLink("", isActive: $goTOCart) {
                    Cart()
                
            }
                NavigationLink(
                    destination: Search(searchTerm: searchText),
                    isActive: $isSearchActive,
                    label: { EmptyView() }
                )
                .hidden()
                
                NavigationLink(
                    destination: UserProfile(username: username),
                    isActive: $goToProfile,
                    label: { EmptyView() }
                )

            
            
            }.clipped()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView(username: "Usitha")
}
var tabs = ["All","Men","Women","Unisex"]
struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {
                
            }) {
                Image("Menu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 30, height:30)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 84,height: 84)
            
            
            Button(action: {}) {
                Image("avatar2")
                    .resizable()
                    .frame(width: 45,height: 45)
                    .cornerRadius(50)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                
            }
            .frame(width: 30, height:30)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
            
            Spacer()
            
            
        }.padding(.horizontal)
    }
}

struct TagLine: View {
    var body: some View {
        Text("Find the best fit for \nall your needs!")
            .font(.custom("", size: 25))
    }
}


struct Searchhome: View {
    @State private var searchText: String = ""
    @State var isSearchActive = false
    
    var body: some View {
        HStack {
            HStack{
                
                TextField("Search clothings", text: $searchText)
                    .padding()
                    .frame(height: 50)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                Button(action: {
                    isSearchActive = true
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                        .frame(width: 55, height: 55)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
            // Other content here
            
            NavigationLink(
                destination: Search(searchTerm: searchText),
                isActive: $isSearchActive,
                label: { EmptyView() }
            )
            .hidden()
        }
        
        
    }
    }
    


struct Banner: View {
    var body: some View {
        HStack{
            HStack{
                Image("curved")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(0)
            }.padding(.horizontal)
                
            
        }
    }
}




struct BottomNavBarItem: View {
    
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
