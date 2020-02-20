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
    
    }


extension Endpoint{
    var base: String{
        return "https://the-cocktail-db.p.rapidapi.com/"
    }
    var headers: [String: String]{
            return ["X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com", "X-RapidAPI-Key": "c2ab8793e5msh6133729172ef20ap1148fdjsn1636ca386f27"]
    }
    var urlComponents: URLComponents {
        
        var components = URLComponents(string: base)!
        components.path = path
        var items = [URLQueryItem]()

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
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

