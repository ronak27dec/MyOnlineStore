//
//  NetworkService.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation
import SwiftUI

class NetworkService: NetworkServiceProtocol {
    private let session: URLSession
    private var task: URLSessionTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchProducts(req: URLRequest, onCompletion: @escaping (Result<[Product], NetworkError>) -> (Void)) {
        
        if task == nil {
            task = session.dataTask(with: req) { data, urlResponse, error in
                
                if let error = error {
                    onCompletion(.failure(.generic(error.localizedDescription)))
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    onCompletion(.failure(.badresponse))
                    return
                }
                
                guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                    onCompletion(.failure(.badStatusCode(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    onCompletion(.failure(.noData))
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode([Product].self, from: data)
                    onCompletion(.success(model))
                }
                catch {
                    print("Parsing Failed with error: \(error)")
                    onCompletion(.failure(.generic(error.localizedDescription)))
                }
            }
            task?.resume()
        } else {
            task?.cancel()
        }        
    }
    
    func fetchThumbnail(req: URLRequest, onCompletion: @escaping (Result<Data, NetworkError>) -> (Void)) {
        if task == nil {
            task = session.dataTask(with: req) { data, urlResponse, error in
                
                if let error = error {
                    onCompletion(.failure(.generic(error.localizedDescription)))
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    onCompletion(.failure(.badresponse))
                    return
                }
                
                guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                    onCompletion(.failure(.badStatusCode(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    onCompletion(.failure(.noData))
                    return
                }
                
                onCompletion(.success(data))
            }
            task?.resume()
        } else {
            task?.cancel()
        }
    }
}
