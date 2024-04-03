//
//  ProductThumbnailView.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import SwiftUI

struct ProductThumbnailView: View {
    
    @StateObject private var vm: ProductThumbnailViewModel
    
    init(urlString: String) {
        _vm = StateObject(wrappedValue: ProductThumbnailViewModel(urlString: urlString))
    }
    
    var body: some View {
        if vm.isLoading {
            ProgressView()
        } else if let image = vm.thumbnailImage {
            Image(uiImage: image)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ProductThumbnailView(urlString: "")
}
