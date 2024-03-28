
import Foundation

import SwiftUI


class ProductViewModel : ObservableObject {
    
    @Published var productResults : [Items] = []
    
//    let baseUrl = "http://127.0.0.1:8000/items";
    let baseUrl = "https://python-backend-ios.onrender.com/items";
    
    
    init() {
        loadProducts()
    }
    
    func loadProducts() {
        guard let url = URL(string: baseUrl) else {return}
        
        URLSession(configuration: .default).dataTask(with:
                                                        URLRequest(url: url)) {data, response, error in
            
            guard let data = data else {return}
            
            do {
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.productResults = productResponse.data
                }
                let productResults = productResponse.data
                print(productResults)
            }
            catch{
                print("Unable to decode the data!!")
            }
        }.resume()
    }
    
    
}


