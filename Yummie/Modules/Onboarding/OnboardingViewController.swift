//
//  Onboarding module - OnboardingViewController.swift
//  Yummie
//
//  Created by sakhnenkoff on 15/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    public var viewModel: OnboardingViewModel!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupBindings()
    }
    
    //MARK: - Configuration
    
    private func configure() {
        view.backgroundColor = .orange
    }

    private func setupBindings() {

    }

}
