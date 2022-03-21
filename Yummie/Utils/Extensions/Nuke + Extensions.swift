//
//  Nuke + Extensions.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 20.03.2022.
//

import UIKit
import Nuke

extension ImageLoadingOptions {
    static let appDefaultOptions = ImageLoadingOptions(placeholder: UIImage(systemName: "mustache"), transition: .fadeIn(duration: 0.2), failureImage: nil, failureImageTransition: nil, contentModes: .init(success: .scaleAspectFit, failure: .scaleAspectFit, placeholder: .scaleAspectFit), tintColors: nil)
}
