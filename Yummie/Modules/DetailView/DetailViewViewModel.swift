//
//  DetailView module - DetailViewViewModel.swift
//  Yummie
//
//  Created by sakhnenkoff on 29/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class DetailViewViewModel {

    let title: String? = ""

    weak var coordinator: Coordinator?
    
    let dish: Dish

    // MARK: - Inputs
    
    func viewDidLoad() {
        
    }

    init(dish: Dish) {
        self.dish = dish
    }
    
    // MARK: - Outputs

}
