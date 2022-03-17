//
//  UserDefaults + Extensions.swift
//  Yummie
//
//  Created by Matthew Sakhnenko on 16.03.2022.
//

import Foundation

@propertyWrapper
struct UserDefault<Value> {
    
    enum Keys: String {
        case hasOnboarded
    }
    
    let key: Keys
    let defaultValue: Value
    var container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.object(forKey: key.rawValue) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults {
    @UserDefault(key: .hasOnboarded, defaultValue: false) static var hasOnboarded: Bool
}
