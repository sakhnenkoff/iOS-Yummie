//
//  DishesList module - DishesListViewModel.swift
//  Yummie
//
//  Created by sakhnenkoff on 07/04/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class DishesListViewModel {

    var title: String? {
        dishCategory.name
    }
    
    let dishCategory: DishCategory
    
    let dishes: [Dish]

    weak var coordinator: Coordinator?

    // MARK: - Inputs
    
    func viewDidLoad() {
    }

    init(dishes: [Dish], dishCategory: DishCategory) {
        self.dishes = dishes
        self.dishCategory = dishCategory
    }
    
    // MARK: - Outputs

}
