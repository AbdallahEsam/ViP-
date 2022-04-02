//
//  Constant.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
enum ConstantsEnum {
    static var baseURL: String {
        return Constants.baseUrlKey + "/api/"
    }
}


struct Constants {
    static let baseUrlKey = "https://mobiletest.fintechrsa.com"
    static var responseValid = "true"
    
}
