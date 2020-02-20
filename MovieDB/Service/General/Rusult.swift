//
//  Rusult.swift
//  AlcoApp
//
//  Created by Armen Nagapetyan on 20.02.2020.
//  Copyright © 2020 Armen Nagapetyan. All rights reserved.
//

import Foundation
enum Result <T,U> where U: Error{
    case success(T)
    case failure(U)
}
