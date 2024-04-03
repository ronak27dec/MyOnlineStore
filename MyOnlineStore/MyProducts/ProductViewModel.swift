//
//  ProductViewModel.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    private let service = NetworkService()
    private let urlString = "https://fakestoreapi.com/products"
    
    @Published var products: [Product] = []
    @Published var error: NetworkError?
    
    func fetchProducts() {
        guard let req = buildProductRequest() else {return}
        
        service.fetchProducts(req: req) { res in
            DispatchQueue.main.async {
                switch res {
                case .success(let products):
                    self.products = products
                    
                case .failure(let error):
                    print(error)
                    self.error = error
                }
            }
        }
    }
    
    private func buildProductRequest() -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.timeoutInterval = 60.0
        req.allowsCellularAccess = true
        req.cachePolicy = .useProtocolCachePolicy
        return req
    }
}
