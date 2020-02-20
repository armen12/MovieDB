//
//  Endpoint.swift
//  AlcoApp
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String {get}
    var path: String {get}
    var headers: [String: String] {get}
    var body: [String: String] {get}
    var httpMethod: String {get}
    
    }


extension Endpoint{
    var base: String{
        return "https://api.themoviedb.org"
    }
    var headers: [String: String]{
        return [:]
    }
    var httpMethod: String {
        return "GET"
    }
    var urlComponents: URLComponents {
        
        var components = URLComponents(string: base)!
        components.path = path
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "api_key", value: "ebea8cfca72fdff8d2624ad7bbf78e4c"))
        for (key,value) in body {
            
            items.append(URLQueryItem(name: key, value: value))
        }
        if !items.isEmpty {
            components.queryItems = items
        }
        return components
    }
    

    var request: URLRequest {
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = httpMethod
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

