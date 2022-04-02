//
//  ValidatorTest.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import XCTest
@testable import VIP_Base
class ValidatorTest: XCTestCase {

    var sut: ValidatorProtocol!
    
   
    override func setUp() {
        super.setUp()
        
        sut = Validator()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil

    }
}

// MARK: - Validate Email
extension ValidatorTest {
    func test_validateMail_isEmpty(){
        let email = ""
        XCTAssertThrowsError(try sut.validateMail(with: email)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyMail.associatedMessage)
            }
        }
    }
    
    func test_validateMail_isNotValid(){
        let email = "ahmed mohamed"
        XCTAssertThrowsError(try sut.validateMail(with: email)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.invalidMail.associatedMessage)
            }
        }
    }
    
    func test_validateMail_isValid(){
        let email = "a@b.com"
        let validatedEmail = try? sut.validateMail(with: email)
        XCTAssertNotNil(validatedEmail)
        XCTAssertEqual(email, validatedEmail)
    }
 
}

// MARK: - Validate Name
extension ValidatorTest {
    func test_validateName_isEmpty() {
        let name = ""
        XCTAssertThrowsError(try sut.validateName(with: name)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyName.associatedMessage)
            }
        }
    }
    
    func test_validateName_tooShort() {
        let name = "abd"
        XCTAssertThrowsError(try sut.validateName(with: name)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortName.associatedMessage)
            }
        }
    }
    
    func test_validateName_isValid(){
        let name = "abdallah essam"
        let validatedName = try? sut.validateName(with: name)
        XCTAssertNotNil(validatedName)
        XCTAssertEqual(name, validatedName)
    }
    
}

// MARK: - Validate Phone
extension ValidatorTest {
    func test_validatePhone_isEmpty() {
        let phone = ""
        XCTAssertThrowsError(try sut.validatePhone(with: phone)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyPhone.associatedMessage)
            }
        }
    }
    
    func test_validatePhone_isNotValid() {
        let phone = "fadf3"
        XCTAssertThrowsError(try sut.validatePhone(with: phone)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.invalidPhone.associatedMessage)
            }
        }
    }
 
    func test_validatePhone_isTooShortWithoutBlus() {
        let phone = "152045545"
        XCTAssertThrowsError(try sut.validatePhone(with: phone)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortPhone.associatedMessage)
            }
        }
    }
    
    func test_validatePhone_isTooShortWithBlus() {
        let phone = "+2011"
        XCTAssertThrowsError(try sut.validatePhone(with: phone)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortPhone.associatedMessage)
            }
        }
    }
    
    func test_validatePhone_isValid() {
        let phone = "+201152045545"
        let validatedPhone = try? sut.validatePhone(with: phone)
        XCTAssertNotNil(validatedPhone)
        XCTAssertEqual(phone, validatedPhone)
    }
}

// MARK: - Validate Value
extension ValidatorTest {
    func test_validateValue_isEmpty() {
        let value = ""
        let desc = "NationalID"
        let count = 16
        XCTAssertThrowsError(try sut.validateValue(with: value, decription: desc, count: count)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyField(decription: desc).associatedMessage)
            }
        }
    }
    
    func test_validateValue_tooShort() {
        let value = "1234"
        let desc = "NationalID"
        let count = 16
        XCTAssertThrowsError(try sut.validateValue(with: value, decription: desc, count: count)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortField(decription: desc, count: count).associatedMessage)
            }
        }
    }
    
    func test_validateValue_isValid() {
        let value = "1234765876546789"
        let desc = "NationalID"
        let count = 16
        let validatedValue = try? sut.validateValue(with: value, decription: desc, count: count)
        XCTAssertNotNil(validatedValue)
        XCTAssertEqual(value, validatedValue)
    }
}

// MARK: - Validate Password
extension ValidatorTest {
    func test_validatePassword_isEmpty() {
        let password = ""
        let minCount = 5
        XCTAssertThrowsError(try sut.validatePassword(with: password, minCount: minCount)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyPass.associatedMessage)
            }
        }
    }
    
    func test_validatePassword_tooShort() {
        let password = "1234"
        let minCount = 5
        XCTAssertThrowsError(try sut.validatePassword(with: password, minCount: minCount)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortPass(count: minCount).associatedMessage)
            }
        }
    }
    
    func test_validatePassword_isValid(){
        let password = "123456"
        let minCount = 5
        let validatedPassword = try? sut.validatePassword(with: password, minCount: minCount)
        XCTAssertNotNil(validatedPassword)
        XCTAssertEqual(password, validatedPassword)
    }
    
}

// MARK: - Validate Confirmation Password
extension ValidatorTest {
    func test_validateConfirmationPassword_isPasswordEmpty() {
        let password = ""
        let confirmationPassword = "3dfsa"
        let minCount = 5
        XCTAssertThrowsError(try sut.validateTwoPasswords(password: password, confirmPassword: confirmationPassword, minCount: minCount)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyPass.associatedMessage)
            }
        }
    }
    
    func test_validateConfirmationPassword_isConfirmationPasswordEmpty() {
        let password = "3dfsa"
        let confirmationPassword = ""
        let minCount = 5
        XCTAssertThrowsError(try sut.validateTwoPasswords(password: password, confirmPassword: confirmationPassword, minCount: minCount)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.emptyConfirmPass.associatedMessage)
            }
        }
    }
    
    func test_validateConfirmationPassword_tooShortPassword() {
        let password = "3dfs"
        let confirmationPassword = "3dfs"
        let minCount = 5
        XCTAssertThrowsError(try sut.validateTwoPasswords(password: password, confirmPassword: confirmationPassword, minCount: minCount)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.tooShortPass(count: minCount).associatedMessage)
            }
        }
    }
    
    func test_validateConfirmationPassword_isValid(){
        let password = "3dfsa"
        let confirmationPassword = "3dfsa"
        let minCount = 5
        let validatedPassword = try? sut.validateTwoPasswords(password: password, confirmPassword: confirmationPassword, minCount: minCount)
        XCTAssertNotNil(validatedPassword)
        XCTAssertEqual(password, validatedPassword)
        XCTAssertEqual(confirmationPassword, validatedPassword)

    }
    
}

// MARK: - Validate Location
extension ValidatorTest {
    func test_validateLocation_latIsEmpty() {
        let lat = ""
        let lng = "32523"
        XCTAssertThrowsError(try sut.validateLocation(lat: lat, lng: lng)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.selectLocation.associatedMessage)
            }
        }
    }
    
    func test_validateLocation_lngIsEmpty() {
        let lat = "32523"
        let lng = ""
        XCTAssertThrowsError(try sut.validateLocation(lat: lat, lng: lng)) { error in
            if let error = error  as? ValidatorError{
                XCTAssertEqual(error.associatedMessage, UserAuthentcationError.selectLocation.associatedMessage)
            }
        }
    }
    
    func test_validateLocation_isValid(){
        let lat = "32523"
        let lng = "32523"
        let validatedLocation = try? sut.validateLocation(lat: lat, lng: lng)
        XCTAssertNotNil(validatedLocation)
        XCTAssertEqual(validatedLocation?.lat, lat)
        XCTAssertEqual(validatedLocation?.lng, lng)

    }
}
