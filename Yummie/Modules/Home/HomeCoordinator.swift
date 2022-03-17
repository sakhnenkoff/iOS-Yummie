//
//  Home module - HomeCoordinator.swift
//  Yummie
//
//  Created by sakhnenkoff on 16/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
	
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
       // .viewModel = HomeViewModel()
       // navigationController.pushViewController(VC, animated: false)
    }
    
    func childDidFinish(child: Child) {
    }
    
    //MARK: - ViewModel Output
    
}
