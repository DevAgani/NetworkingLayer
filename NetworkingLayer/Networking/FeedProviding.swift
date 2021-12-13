//
//  FeedProviding.swift
//  NetworkingLayer
//
//  Created by George Nyakundi on 13/12/2021.
//

import Foundation

protocol FeedProviding {
    
    var network: Networking { get }
    
    func getFeed(_ completion: @escaping (Result<Feed, Error>) -> Void)
}

extension FeedProviding {
    func getFeed(_ completion: @escaping (Result<Feed, Error>) -> Void) {
        network.execute(Endpoint.feed, completion: completion)
    }
}
