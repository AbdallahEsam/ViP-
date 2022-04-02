//
//  UserData.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

enum UserType: String {
    case client
    case guest
}
protocol CacheServiceProtocol {
    func getUserData() -> UserData?
    func setUserData(_ newValue: UserData?)
    var userType: UserType {get}
}
class CacheService {
    private let userDataKey = "_UserData_"
}

extension CacheService: CacheServiceProtocol {
    func getUserData() -> UserData? {
        let defaults = UserDefaults.standard
        guard let savedPerson = defaults.object(forKey: userDataKey) as? Data,
              let loadedData = try? JSONDecoder().decode(UserData.self, from: savedPerson)
        else { return nil }
        return loadedData
    }
    
     func setUserData(_ newValue: UserData?) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(newValue) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: userDataKey)
        } else {
            fatalError("Unable To Save User Data")
        }
    }

    var userType: UserType {
        guard getUserData()?.token != nil else{return .guest}
        return .client
    }
    
  
}
