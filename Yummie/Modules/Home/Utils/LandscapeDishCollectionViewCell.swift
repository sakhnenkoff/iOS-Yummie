//
//  LandscapeDishCollectionViewCell.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 24.03.2022.
//

import UIKit
import Nuke

class LandscapeDishCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet
    weak var specialImageView: UIImageView!
    
    @IBOutlet
    weak var specialTitleLabel: UILabel!
    
    @IBOutlet
    weak var specialDescriptionLabel: UILabel!
    
    @IBOutlet
    weak var specialCaloriesLabel: UILabel!
    
      override func awakeFromNib() {
        configure()
    }
    
    //MARK: - Configuration
    
    private func configure() {
    }
    
    override func layoutSubviews() {
        specialImageView.layer.cornerRadius = 5
        specialImageView.clipsToBounds = true
    }
    
    //MARK: - Public
    
    func configure(with dish: Dish?) {
        specialTitleLabel.text = dish?.name
        specialCaloriesLabel.text = dish?.formattedCalories
        specialDescriptionLabel.text = dish?.description
        Nuke.loadImage(with: dish?.imageString, into: specialImageView)
        
    }
}
