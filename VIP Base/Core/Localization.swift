//
//  Localization.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation
struct Localization {
    
    enum LocalizationKey: String {
        case invalidEmail = "invalid_Email"
        case shortFullName = "short_full_name"
        case passwordShouldBe = "Password_Should_Be"
        case chars = "Chars"
        case emptyName = "Empty_Name"
        case pleaseEnterValid = "Please_Enter_Valid"
        case mustBeAtleast = "Must_Be_At_least"
        case emptyMail = "Empty_Mail"
        case enterPassword = "enter_password_message"
        case enterConfirmationPassword = "enter_Confirmation_Password"
        case phoneMustBeAtLeast = "phone_Must_Be_At_Least"
        case enterPhone = "enter_your_phone_number"
        case invalidPhone = "invalid_Phone"
        case notTheSamePasswords = "not_the_same_passwords"
        case selectLocation = "select_location"
        case error = "error"
        case cannotDecode = "cannot_decode"
        case noInternet = "no_internet"
        case error401 = "error_401"
        case error500 = "error_500"
        case timeoutError = "timeout_Error"
        case success = "success"
        case warning = "warning"
    }
    
    static func string(for key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}

