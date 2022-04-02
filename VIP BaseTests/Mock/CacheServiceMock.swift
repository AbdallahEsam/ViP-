//
//  CacheServiceMock.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base

class CacheServiceMock: CacheServiceProtocol {
    var userData: UserData? 
    func getUserData() -> UserData? {
        return userData
    }
    
    func setUserData(_ newValue: UserData?) {
        self.userData = newValue
    }
    
    var userType: UserType = .client
    
    
}
