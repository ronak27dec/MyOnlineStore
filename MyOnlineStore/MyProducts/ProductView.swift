//
//  ProductView.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import SwiftUI

struct ProductView: View {
    @StateObject private var vm: ProductViewModel
    
    init() {
        _vm = StateObject(wrappedValue: ProductViewModel())
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.products) { product in
                    NavigationLink("") {
                        ProductDetailView(viewModel: ProductDetailViewModel(imageURLString: product.image,
                                                                            price: product.price,
                                                                            category: product.category,
                                                                            rating: product.rating))
                    }
                    
                    ProductRowView(product: product)
                }
            }
            .navigationTitle("Products")
        }
        .onAppear {
            vm.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
