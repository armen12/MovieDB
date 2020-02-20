//
//  Bundle.swift
//  AlcoApp
//
//  Created by Armen on 8/9/19.
//  Copyright © 2019 Armen. All rights reserved.
//

import Foundation
extension Bundle {
    
    static func loadView<T>(withType type: T.Type) -> T {
        return Bundle.loadView(fromNib: String(describing: T.self), withType: T.self)
    }
    
    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }
        
        fatalError("Could not load view with type " + String(describing: type))
    }
}
