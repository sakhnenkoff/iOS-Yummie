//
//  DishesList module - DishesListCoordinator.swift
//  Yummie
//
//  Created by sakhnenkoff on 07/04/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

final class DishesListCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
   	var parentCoordinator: Coordinator?
    
    let dishes: [Dish]
    let category: DishCategory

    var rootViewController: UIViewController? {
        return self.navigationController
    }

    private var navigationController: UINavigationController

    // MARK: - Init
    init(navigationController: UINavigationController, dishes: [Dish], category: DishCategory) {
        self.navigationController = navigationController
        
        self.dishes = dishes
        self.category = category
    }

    func start() {
        showDishesListScreen()
    }

    // MARK: - Actions
    
    private func showDishesListScreen() {
        let dishesListVC: DishesListViewController = .instantiate(storyboard: .main)
        dishesListVC.viewModel = DishesListViewModel(dishes: dishes, dishCategory: category)
        navigationController.pushViewController(dishesListVC, animated: true)
    }
    
    func childDidFinish(child: ChildCoordinator) {
    }
    
    //MARK: - ViewModel Output
    
}
