//
//  ProductThumbnailViewModel.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation
import SwiftUI

class ProductThumbnailViewModel: ObservableObject {
    
    @Published var thumbnailImage: UIImage?
    @Published var error: NetworkError?
    var isLoading = true
    private let service = NetworkService()
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        fetchThumbnail()
    }
    
    func fetchThumbnail() {
        thumbnailImage = nil
        isLoading = true
        guard let req = buildThumbnailRequest() else {return}
        
        service.fetchThumbnail(req: req) { res in
            DispatchQueue.main.async {
                self.isLoading = false
                switch res {
                case .success(let imageData):
                    self.thumbnailImage = UIImage(data: imageData)
                    
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    private func buildThumbnailRequest() -> URLRequest? {
        guard let url = URL(string: urlString) else { return nil }
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.timeoutInterval = 60.0
        req.allowsCellularAccess = true
        req.cachePolicy = .useProtocolCachePolicy
        return req
    }
}
