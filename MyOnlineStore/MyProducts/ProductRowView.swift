//
//  ProductRowView.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import SwiftUI

struct ProductRowView: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            ProductThumbnailView(urlString: product.image)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text(product.description)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    ProductRowView(product: Product(id: 1,
                                    title: "Product Title",
                                    price: 2.75,
                                    description: "Product Description",
                                    category: "Mens Clothing",
                                    image: "--",
                                    rating: Rating(rate: 4.5, count: 100)))
}
