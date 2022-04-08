//
//  DetailView module - DetailViewCoordinator.swift
//  Yummie
//
//  Created by sakhnenkoff on 29/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

final class DetailViewCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
   	var parentCoordinator: Coordinator?

    var rootViewController: UIViewController? {
        return self.navigationController
    }

    private var navigationController: UINavigationController
    
    private let dish: Dish

    // MARK: - Init
    init(navigationController: UINavigationController, dish: Dish) {
        self.navigationController = navigationController
        
        self.dish = dish
    }

    func start() {
        showDetailViewScreen()
    }

    // MARK: - Actions
    
    private func showDetailViewScreen() {
        let detailVC: DetailViewViewController = .instantiate(storyboard: .main)
        detailVC.viewModel = DetailViewViewModel(dish: dish)
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func childDidFinish(child: ChildCoordinator) {
    }
    
    //MARK: - ViewModel Output
    
}
