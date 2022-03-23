//
//  CardShadowView.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 23.03.2022.
//

import UIKit

final class CardShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    
        configure()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.3
        
        cornerRadius = 10
    }
    
}
