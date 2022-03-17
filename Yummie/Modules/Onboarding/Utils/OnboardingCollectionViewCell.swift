//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 16.03.2022.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet
    weak var slideImageView: UIImageView!
    
    @IBOutlet
    weak var slideTitleLabel: UILabel!
    
    @IBOutlet
    weak var slideSubTitleLabel: UILabel!
    
    //MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        slideImageView.contentMode = .scaleAspectFit
    }
    
    public func configure(with slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.tile
        slideSubTitleLabel.text = slide.description
    }
}
