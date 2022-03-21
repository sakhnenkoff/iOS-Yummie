//
//  UIView + Extensions.swift
//  EventUally
//
//  Created by Matthew Sakhnenko on 20.02.2022.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    func addMoreSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    var width: CGFloat { self.frame.size.width }
    var height: CGFloat { self.frame.size.height }
}
