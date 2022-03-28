//
//  RevealAnimator.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 28.03.2022.
//

import UIKit

final class RevealAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let animationDuration = 2.0
    var operation: UINavigationController.Operation = .pop
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
      return animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    }
}
