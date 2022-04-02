//
//  Validator.swift
//  VIP Base
//
//  Created by fintech on 12/01/2022.
//

import Foundation

enum UserAuthentcationError: ValidatorError {
    
    case invalidMail
    case invalidPhone
    case tooShortName
    case tooShortPass(count: Int)
    case tooShortPhone
    case emptyName
    case emptyPass
    case emptyConfirmPass
    case emptyMail
    case emptyPhone
    case notTheSamePasswords
    case selectLocation
    case emptyField(decription: String)
    case tooShortField(decription: String, count: Int)
    
    internal var associatedMessage: String {
        var message = Localization.string(for: .error)
        
        switch self {
        case .invalidMail:
            message = Localization.string(for: .invalidEmail)
        case .tooShortName:
            message = Localization.string(for: .shortFullName)
        case .tooShortPass(let count):
            message = Localization.string(for: .passwordShouldBe) + "\(count)" + Localization.string(for: .chars)
        case .emptyName:
            message = Localization.string(for: .emptyName)
        case .emptyPass:
            message = Localization.string(for: .enterPassword)
        case .emptyConfirmPass:
            message = Localization.string(for: .enterConfirmationPassword)
        case .emptyMail:
            message = Localization.string(for: .emptyMail)
        case .emptyField(let decription):
            message = Localization.string(for: .pleaseEnterValid) + "\(decription)"
        case .tooShortField(let decription, let count):
            message = Localization.string(for: .pleaseEnterValid) + "\(decription), " + Localization.string(for: .mustBeAtleast) + " \(count)."
        case .tooShortPhone:
            message = Localization.string(for: .phoneMustBeAtLeast)
        case .emptyPhone:
            message = Localization.string(for: .enterPhone)
        case .invalidPhone:
            message = Localization.string(for: .invalidPhone)
        case .notTheSamePasswords:
            message = Localization.string(for: .notTheSamePasswords)
        case .selectLocation:
            message = Localization.string(for: .selectLocation)
        }
        return message
    }
}
protocol ValidatorProtocol {
    @discardableResult func validateMail(with mail: String?) throws -> String
    @discardableResult func validateName(with name: String?) throws -> String
    @discardableResult func validatePhone(with phone: String?) throws -> String
    @discardableResult func validateValue(with value: String?, decription: String, count: Int) throws -> String
    @discardableResult func validatePassword(with password: String?, minCount: Int) throws -> String
    @discardableResult func validateTwoPasswords(password: String?, confirmPassword: String?, minCount: Int) throws  -> String
    @discardableResult func validateLocation(lat: String?, lng: String?) throws  -> (lat: String, lng: String)
}


class Validator: ValidatorProtocol{
    @discardableResult func validateMail(with mail: String?) throws -> String {
        if let mail = mail {
            if mail.isEmpty {
                throw UserAuthentcationError.emptyMail
            } else if !mail.trimmedString.isEmail {
                throw UserAuthentcationError.invalidMail
            } else {
                return mail.trimmedString
            }
        } else {
            throw UserAuthentcationError.emptyMail
        }
    }
    
    @discardableResult func validateName(with name: String?) throws -> String {
        if let name = name {
            if name.isEmpty {
                throw UserAuthentcationError.emptyName
            } else if name.count < 6 {
                throw UserAuthentcationError.tooShortName
            } else {
                return name
            }
        } else {
            throw UserAuthentcationError.emptyName
        }
    }
    
    @discardableResult func validatePhone(with phone: String?) throws -> String {
        if let phone = phone {
            if phone.isEmpty {
                throw UserAuthentcationError.emptyPhone
            } else if !phone.isInt {
                if phone.replacingOccurrences(of: "+", with: "").isInt {
                    return phone
                } else {
                    throw UserAuthentcationError.invalidPhone
                }
            } else if phone.count < 10 {
                throw UserAuthentcationError.tooShortPhone
            } else {
                return phone
            }
        } else {
            throw UserAuthentcationError.emptyPhone
        }
    }
    
    @discardableResult func validateValue(with value: String?, decription: String, count: Int = 1) throws -> String {
        if let value = value {
            if value.isEmpty {
                throw UserAuthentcationError.emptyField(decription: decription)
            } else if value.count < count {
                throw UserAuthentcationError.tooShortField(decription: decription, count: count)
            } else {
                return value
            }
        } else {
            throw UserAuthentcationError.emptyField(decription: decription)
        }
    }
    
   
    @discardableResult func validatePassword(with password: String?, minCount: Int = 4) throws -> String {
        guard let password = password, !password.isEmpty else {
            throw UserAuthentcationError.emptyPass
        }
        guard password.count >= minCount else {
            throw UserAuthentcationError.tooShortPass(count: minCount)
        }
        return password
    }
    
    @discardableResult func validateTwoPasswords(password: String?, confirmPassword: String?, minCount: Int = 6) throws  -> String {
        guard let password = password, !password.isEmpty else {
            throw UserAuthentcationError.emptyPass
        }
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty else {
            throw UserAuthentcationError.emptyConfirmPass
        }
        guard password == confirmPassword else {
            throw UserAuthentcationError.notTheSamePasswords
        }
        guard password.count >= minCount else {
            throw UserAuthentcationError.tooShortPass(count: minCount)
        }
        return password
    }
    
    
    @discardableResult func validateLocation(lat: String?, lng: String?) throws  -> (lat: String, lng: String) {
        if let lat = lat, let lng = lng, !lat.isEmpty, !lng.isEmpty {
            return (lat: lat, lng: lng)
        } else {
            throw UserAuthentcationError.selectLocation
        }
    }
}
private extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: trimmedString)
    }
}
