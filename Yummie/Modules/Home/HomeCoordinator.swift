//
//  Home module - HomeCoordinator.swift
//  Yummie
//
//  Created by sakhnenkoff on 16/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

protocol HomeCoordinating: AnyObject {
    func coordinateToDetail(with dish: Dish)
    func coordinateToCategoryList(with category: DishCategory, dishes: [Dish])
}

final class HomeCoordinator: Coordinator, HomeCoordinating {
	
	var childCoordinators: [Coordinator] = []
   	var parentCoordinator: Coordinator?

    var rootViewController: UIViewController? {
        return self.navigationController
    }

    private var navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showHomeScreen()
    }

    // MARK: - Actions
    
    private func showHomeScreen() {
        let homeVC: HomeViewController = .instantiate(storyboard: .main)
        homeVC.viewModel = HomeViewModel(networkService: AppNetworkingService())
        homeVC.viewModel.coordinator = self 
        navigationController.pushViewController(homeVC, animated: false)
    }
    
    func childDidFinish(child: ChildCoordinator) {
    }
    
    //MARK: - ViewModel Output & Navigation
    
    func coordinateToDetail(with dish: Dish) {
        let detailCoordinator = DetailViewCoordinator(navigationController: navigationController, dish: dish)
        detailCoordinator.parentCoordinator = self
        detailCoordinator.start()
    }
    
    func coordinateToCategoryList(with category: DishCategory, dishes: [Dish]) {
        let categoryCoordinator = DishesListCoordinator(navigationController: navigationController, dishes: dishes, category: category)
        categoryCoordinator.parentCoordinator = self
        categoryCoordinator.start()
    }
    
}
