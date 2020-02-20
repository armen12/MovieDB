//
//  UIView.swift
//  AlcoApp
//
//  Created by Armen on 8/9/19.
//  Copyright © 2019 Armen. All rights reserved.
//

import UIKit
extension UIView{
    func showView(withAnimation time: TimeInterval = 0.25) {
        self.alpha = 0.0
        self.isHidden = false
        
        UIView.animate(withDuration: time) {
            self.alpha = 1.0
        }
    }
    
    func hideView(withAnimation time: TimeInterval = 0.25) {
        UIView.animate(withDuration: time, animations: {
            self.alpha = 0.0
        }) { (_) in
            self.isHidden = true
        }
    }
    
    func roundCornersWithRadius(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    func circleView(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2

    }
}

