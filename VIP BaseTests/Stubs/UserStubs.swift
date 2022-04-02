//
//  UserStubs.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base
class UserStubs {
    static func createUser() -> LoginModel {
        return .init(status: true, data: .init(id: 2, token: .init(tokenType: "bearer", accessToken: "token")), msg: "true", isActive: true, identifier: "id")
    }
}
    
