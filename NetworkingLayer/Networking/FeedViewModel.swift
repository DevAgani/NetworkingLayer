//
//  FeedViewModel.swift
//  NetworkingLayer
//
//  Created by George Nyakundi on 13/12/2021.
//

import Foundation

class FeedViewModel {
    let service: FeedProviding
    var feed: Feed?
    var onFeedUpdate: () -> Void = {}
    
    init(service: FeedProviding) {
        self.service = service
    }
    
    func fetch() {
        service.getFeed { result in
            switch result {
            case .success:
                print("All went well")
            case .failure:
                print("Opps something went woring")
            }
        }
    }
}

struct Feed: Codable {
    
}
