//
//  Home module - HomeViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 16/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit
import CoreAudio

class HomeViewController: UIViewController {
    
    public var viewModel: HomeViewModel!
    
    @IBOutlet
    weak var foodCategoryCollectionView:
    UICollectionView! {
        didSet {
            foodCategoryCollectionView.delegate = self
            foodCategoryCollectionView.dataSource = self
        }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        title = viewModel.title
        
    }

    private func setupBindings() {
        viewModel.categories.bind { [weak self] _ in
            self?.reloadData()
        }
    }
    
    private func reloadData() {
        foodCategoryCollectionView.reloadData()
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
            guard let data = viewModel.categories.value else { fatalError() }
        
        cell.configure(with: data[indexPath.row])

        return cell
    }
}
