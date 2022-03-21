//
//  String + Extensions.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 20.03.2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
