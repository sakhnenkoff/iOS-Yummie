//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 19.03.2022.
//

import UIKit
import Nuke

public enum CellType {
    case category
    case popular
    case chefs
}

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet
    weak var categoryImageView: UIImageView!
    
    @IBOutlet
    weak var categoryLabel: UILabel!
        
    override func awakeFromNib() {
        configure()
    }
    
    //MARK: - Configuration
    
    private func configure() {
    }
    
    //MARK: - Public
    
    func configure(with category: DishCategory?) {
        categoryLabel.text = category?.name
        Nuke.loadImage(with: category?.imageString, into: categoryImageView)
    }
}
