//
//  RequestProviding.swift
//  NetworkingLayer
//
//  Created by George Nyakundi on 13/12/2021.
//

import Foundation

enum Endpoint {
    case feed
}

protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .feed:
            guard let url = URL(string: "http://something.com") else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            
            return URLRequest(url: url)
        }
    }
}
