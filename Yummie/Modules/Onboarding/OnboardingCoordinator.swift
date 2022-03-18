//
//  Onboarding module - OnboardingCoordinator.swift
//  Yummie
//
//  Created by sakhnenkoff on 15/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
	
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
        showOnboardingScreen()
    }

    // MARK: - Actions
    
    private func showOnboardingScreen() {
        let onboardingVC: OnboardingViewController = .instantiate(storyboard: .main)
        onboardingVC.viewModel = OnboardingViewModel()
        onboardingVC.viewModel.coordinator = self
        navigationController.pushViewController(onboardingVC, animated: false)
    }
    
    func childDidFinish(child: Child) {
    }
    
    //MARK: - ViewModel Output
    
    func didFinishOnboarding() {
        parentCoordinator?.childDidFinish(child: .onboarding(self))
    }
    
}
