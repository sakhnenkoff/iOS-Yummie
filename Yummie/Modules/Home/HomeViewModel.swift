//
//  Home module - HomeViewModel.swift
//  Yummie
//
//  Created by sakhnenkoff on 16/03/2022.
//  Copyright © 2022 matthews.co. All rights reserved.
//

import UIKit

class HomeViewModel {
    
    let title = "Yummie"
        
    weak var coordinator: Coordinator?
    
    let networkService: NetworkingServicing
    
    var categories: Observable<[DishCategory]> = .init([
        .init(id: "id1", name: "African Dish 1", imageString: "https://picsum.photos/200/200"),
        .init(id: "id1", name: "African Dish 2", imageString: "https://picsum.photos/200/200"),
        .init(id: "id1", name: "African Dish 3", imageString: "https://picsum.photos/200/200"),
        .init(id: "id1", name: "African Dish 4" , imageString: "https://picsum.photos/200/200"),
        .init(id: "id1", name: "African Dish 5" , imageString: "https://picsum.photos/200/200"),
    ])
    
    var dishes: Observable<[Dish]> = .init([
        .init(id: "id1", name: "Some dish 1", description: "Some text", imageString: "https://picsum.photos/300/500", caloris: 20.5),
        .init(id: "id1", name: "Some dish 2", description: "Some text", imageString: "https://picsum.photos/300/500", caloris: 20.5),
        .init(id: "id1", name: "Some dish 3", description: "Some text", imageString: "https://picsum.photos/300/500", caloris: 20.5),
        .init(id: "id1", name: "Some dish 4", description: "Some text", imageString: "https://picsum.photos/300/500", caloris: 20.5),
    ])

    func viewDidLoad() {
        fetchData()
    }

    init(networkService: NetworkingServicing) {
        self.networkService = networkService
    }
    
    //MARK: - Actions
    
    private func fetchData() {
        networkService.fetchData()
    }
    
    
    // MARK: - Outputs
    
    

}
