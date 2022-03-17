//
//  AppCoordinator.swift
//  Bankey
//
//  Created by Matthew Sakhnenko on 15.02.2022.
//

import Foundation
import UIKit

enum Child {
    case onboarding(Coordinator)
    case home(Coordinator)
}

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    var parentCoordinator: Coordinator? { get }
    var rootViewController: UIViewController? { get }
    
    func start()
    func childDidFinish(child: Child)
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
        if !UserDefaults.hasOnboarded {
            
        }
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func childDidFinish(child: Child) {
        var coordinator: Coordinator
        
        switch child {
        case .onboarding(let cord):
            coordinator = cord
            UserDefaults.hasOnboarded = true
        case .home(let cord):
            coordinator = cord
        }
        childCoordinators.removeAll() { $0 === coordinator }
    }
    
}
