//
//  AuthRouters.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "v1/login"
        }
    }
    
    var parameters: [String : Any]?  {
        switch self {
        case .login( let email, let password):
            return  ["email": email, "password": password]
        }
    }
}
