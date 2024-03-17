import SwiftUI
import SDWebImageSwiftUI
struct UserRow: View {
   
    @State var show = false
    let product: Items
    var body: some View {
        VStack(spacing: 1){
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                 
                Button {
                    show.toggle()
                } label: {
                    AnimatedImage(url: URL(string: product.image))
                        .resizable()
                        .frame(width: 160,height: 230)
                        .cornerRadius(15)
                }
                Button {
                } label: {
                                       
                   /* Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .padding(.all,10)
                            .background(Color.white)
                            .clipShape(Circle())*/
                }
                .padding(.all,20)
            }
            Text(product.name)
            
                
        }.padding(.horizontal,15)
            .sheet(isPresented: $show, content: {
                
                DetailView(product: product)
            })

        
    }
}
 
struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let sampleProduct = Items(id: 1, name: "Sample Product", description: "Sample Description", price: "$19.99", category: "Men", size: "M", color: "Black", image: "sample_image", quantity: 10, createdAt: "2024-03-17", updatedAt: "2024-03-17")
                
        UserRow(product: sampleProduct)
    }
}
