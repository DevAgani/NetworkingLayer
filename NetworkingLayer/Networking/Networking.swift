//
//  Networking.swift
//  NetworkingLayer
//
//  Created by George Nyakundi on 13/12/2021.
//

import Foundation

protocol Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void)
}


extension Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProviding, completion: @escaping (Result<T, Error>) -> Void){
        let urlRequest = requestProvider.urlRequest
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    preconditionFailure("No error was receieved but we also don't have data")
                }
                
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
