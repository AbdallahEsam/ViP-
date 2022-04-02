//
//  UserData.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation

// MARK: - LoginModel
struct LoginModel: BaseCodable {
    var status: Bool
    var data: UserData?
    var msg: String?
    var isActive: Bool?
    var identifier: String?

    enum CodingKeys: String, CodingKey {
        case data, status, msg
        case isActive = "is_active"
        case identifier
    }
}

// MARK: - UserData
struct UserData: Codable {
    var id: Int?
    var token: Token?
}

// MARK: - Token
struct Token: Codable {
    var tokenType, accessToken: String?

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
    }
}




