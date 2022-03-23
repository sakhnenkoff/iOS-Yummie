//
//  BigDishCollectionViewCell.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 23.03.2022.
//

import UIKit
import Nuke

class BigDishCollectionViewCell: UICollectionViewCell {
            
    @IBOutlet
    weak var dishLabel: UILabel!
    
    @IBOutlet
    weak var dishCaloriesLabel: UILabel!
    
    @IBOutlet
    weak var dishImageView: UIImageView!
    
    @IBOutlet
    weak var dishDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        configure()
    }
    
    //MARK: - Configuration
    
    private func configure() {
    }
    
    //MARK: - Public
    
    func configure(with dish: Dish?) {
        dishLabel.text = dish?.name
        dishCaloriesLabel.text = dish?.formattedCalories
        dishDescriptionLabel.text = dish?.description
        Nuke.loadImage(with: dish?.imageString?.asUrl, options: .appDefaultOptions, into: dishImageView) { _ in
        }
        
    }
}
