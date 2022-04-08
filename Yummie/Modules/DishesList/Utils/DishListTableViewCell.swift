//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 07.04.2022.
//

import UIKit
import SnapKit
import Nuke

final class DishListTableViewCell: UITableViewCell {
        
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let dishTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let dishDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configuration
    
    private func configure() {
        selectionStyle = .none
                
        let cardShadowView = CardShadowView(frame: .zero)
        contentView.addMoreSubviews(cardShadowView)
        
        cardShadowView.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        cardShadowView.layer.borderWidth = 1
        
        cardShadowView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().offset(-8)
        }
                
        cardShadowView.addMoreSubviews(cellImageView, stackView)
        
        cellImageView.snp.makeConstraints { make in
            make.width.height.equalTo(52)
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-12)
            make.right.equalToSuperview().offset(-12)
            
            make.left.equalTo(cellImageView.snp_rightMargin).offset(24)
        }
        
        stackView.addArrangedSubview(dishTitleLabel)
        stackView.addArrangedSubview(dishDescriptionLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellImageView.layer.cornerRadius = 14
    }
    
    public func configure(with category: DishCategory, dish: Dish) {
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
                
        guard let imageString = category.imageString, let url = URL(string: imageString) else { return }
        
        Nuke.loadImage(with: url, into: cellImageView)
    }
    
}
