//
//  NetworkError.swift
//  MyOnlineStore
//
//  Created by Ronak Malick on 29/03/24.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case badresponse
    case parsingFailed
    case badURL
    case generic(String)
    case badStatusCode(Int)
    case noData
}
