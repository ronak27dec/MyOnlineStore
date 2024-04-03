//
//  ProductDetailView.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    private let viewModel: ProductDetailViewModel
    @StateObject private var vm: ProductThumbnailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        _vm = StateObject(wrappedValue: ProductThumbnailViewModel(urlString: viewModel.imageURLString))
    }
    
    var body: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.thumbnailImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 400, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            Text(viewModel.category)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text(String(viewModel.price))
                .font(.largeTitle)
                .fontWeight(.heavy)
        }
        .padding()
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(imageURLString: "-",
                                                        price: 0.0,
                                                        category: "-",
                                                        rating: Rating(rate: 0.0, count: 0)))
}
