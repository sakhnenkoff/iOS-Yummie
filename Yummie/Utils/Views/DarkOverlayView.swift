//
//  DarkOverlayView.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 29.03.2022.
//

import UIKit

final class DarkOverlayView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        backgroundColor = .black
        
        self.alpha = 0.2
    }
}
