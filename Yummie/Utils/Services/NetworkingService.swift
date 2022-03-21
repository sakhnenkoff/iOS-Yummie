//
//  NetworkingService.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 20.03.2022.
//

import Foundation

protocol NetworkingServicing: AnyObject {
    func fetchData()
}

final class AppNetworkingService: NetworkingServicing {
    
    func fetchData() {
        print("data has been fetched")
    }

}
