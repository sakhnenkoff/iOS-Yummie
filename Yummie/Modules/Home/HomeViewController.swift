//
//  Home module - HomeViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 16/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit
import CoreAudio
import CoreMedia
import SwiftUI

class HomeViewController: UIViewController {
    
    public var viewModel: HomeViewModel!
    
    @IBOutlet
    weak var foodCategoryCollectionView:
    UICollectionView!
    
    @IBOutlet
    weak var popularCollectionView: UICollectionView!
    
    @IBOutlet
    weak var specialCollectionView: UICollectionView!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        title = viewModel.title
        
        configureCollections()
    }
    
    private func configureCollections() {
        [foodCategoryCollectionView,popularCollectionView,specialCollectionView].forEach() {
            $0?.delegate = self
            $0?.dataSource = self
        }
    }

    private func setupBindings() {
        viewModel.categories.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
        
        viewModel.dishes.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
    
    private func reloadData() {
        [specialCollectionView,foodCategoryCollectionView,popularCollectionView].forEach() {
            $0?.reloadData()
        }
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case foodCategoryCollectionView:
            return viewModel.categories.value?.count ?? 0
        case popularCollectionView:
            return viewModel.dishes.value?.count ?? 0
        case specialCollectionView:
            return viewModel.dishes.value?.count ?? 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case foodCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: viewModel.categories.value?[indexPath.item])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BigDishCollectionViewCell.self), for: indexPath) as! BigDishCollectionViewCell
            cell.configure(with: viewModel.dishes.value?[indexPath.item])
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LandscapeDishCollectionViewCell.self), for: indexPath) as! LandscapeDishCollectionViewCell
            cell.configure(with: viewModel.dishes.value?[indexPath.item])
            return cell
        default: fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == foodCategoryCollectionView {
            viewModel.didSelectCategoryList(category: viewModel.categories.value?[indexPath.row], dishes: viewModel.dishes.value)
        } else {
            viewModel.didSelectDish(at: indexPath)
        }
    }
}
