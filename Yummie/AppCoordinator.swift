//
//  AppCoordinator.swift
//  Bankey
//
//  Created by Matthew Sakhnenko on 15.02.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    var parentCoordinator: Coordinator? { get }
    var rootViewController: UIViewController? { get }
    
    func start()
    func childDidFinish(child: Coordinator)
}

final class AppCoordinator: Coordinator {
    
    var rootViewController: UIViewController? {
        return window.rootViewController
    } //
    
    private(set) var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator? // 
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func childDidFinish(child: Coordinator) {
    }
    
}
