//
//  Onboarding module - OnboardingViewModel.swift
//  Yummie
//
//  Created by sakhnenkoff on 15/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

struct OnboardingSlide {
    let tile: String
    let description: String
    let image: UIImage?
}

extension OnboardingSlide {
    static let slides: [OnboardingSlide] = [
        .init(tile: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: UIImage(named: "slide1")),
        .init(tile: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide2")),
        .init(tile: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3"))
    ]
}


class OnboardingViewModel {

    // MARK: - Inputs
    
    weak var coordinator: OnboardingCoordinator?
    
    var slides = OnboardingSlide.slides

    func viewDidLoad() {
    }

    init() {}
    
    // MARK: - Outputs
    
    func didFinishOnboarding() {
        coordinator?.didFinishOnboarding()
    }

}
