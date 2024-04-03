//
//  NetworkServiceProtocol.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation
import SwiftUI

protocol NetworkServiceProtocol {
    func fetchProducts(req: URLRequest, onCompletion: @escaping (Result<[Product], NetworkError>) -> (Void))
    func fetchThumbnail(req: URLRequest, onCompletion: @escaping (Result<Data, NetworkError>) -> (Void))
}
