//
//  ValidatorMock.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base

class ValidatorMock{
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
}

extension ValidatorMock: ValidatorProtocol {
    func validateMail(with mail: String?) throws -> String {
        isEmailValidated = true
        return mail ?? ""
    }
    
    func validateName(with name: String?) throws -> String {
        return name ?? ""
    }
    
    func validatePhone(with phone: String?) throws -> String {
        return phone ?? ""
    }
    
    func validateValue(with value: String?, decription: String, count: Int) throws -> String {
        return value ?? ""
    }
    
    func validatePassword(with password: String?, minCount: Int) throws -> String {
        isPasswordValidated = true
        return password ?? ""
    }
    
    func validateTwoPasswords(password: String?, confirmPassword: String?, minCount: Int) throws -> String {
        return password ?? ""
    }
    
    func validateLocation(lat: String?, lng: String?) throws -> (lat: String, lng: String) {
        return (lat ?? "", lng ?? "")
    }
    
    
}
