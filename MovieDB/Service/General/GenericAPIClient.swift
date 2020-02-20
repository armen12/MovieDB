//
//  GenericAPIClient.swift
//  AlcoApp
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}

protocol APIClient {

    var session: URLSession {get}
    func fetch <T: Decodable>(request: URLRequest,decode: @escaping (Decodable) -> T?, completion:  @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    
    typealias JSONComplitionHandler = (Decodable?, APIError?) -> Void
    func decodingTask <T: Decodable> (requset: URLRequest, decodingType: T.Type, completion: @escaping JSONComplitionHandler)  -> URLSessionDataTask {
        let task = session.dataTask(with: requset) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                if let data = data {
                    do{
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                }else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }
    
    func fetch  <T: Decodable>(request: URLRequest,decode: @escaping (Decodable) -> T?, completion:  @escaping (Result<T, APIError>) -> Void){
        
        let task = decodingTask(requset: request, decodingType: T.self) { (json, error) in
            DispatchQueue.main.async {
                guard let json = json else{
                    if let error = error {
                        completion(Result.failure(error))
                    } else {
                        completion(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode(json) {
                    completion(.success(value))
                } else {
                    completion(.failure(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
}

