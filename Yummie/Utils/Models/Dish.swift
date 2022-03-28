//
//  Dish.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 27.03.2022.
//

import Foundation

struct Dish: Codable {
    let id: String?
    let name: String?
    let description: String?
    let imageString: String?
    let calories: Int?
    
    var formattedCalories: String {
        guard let calolories = calories else { return "" }
        return "\(calolories) calories"
    }
}
