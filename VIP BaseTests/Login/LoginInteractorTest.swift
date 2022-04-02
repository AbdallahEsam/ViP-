//
//  LoginInteractorTest.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import XCTest
@testable import VIP_Base

class LoginInteractorTest: XCTestCase {

    var sut: LoginInteractor!
    var network: NetworkSpy!
    var repo: AuthRepoMock!
    var validator: ValidatorMock!
    var presenter: LoginPresenterSpy!
    var cacheService: CacheServiceMock!
    override func setUp() {
        super.setUp()
        
        network = NetworkSpy()
        repo = AuthRepoMock(network: network)
        validator = ValidatorMock()
        presenter = LoginPresenterSpy()
        cacheService = CacheServiceMock()
        sut = .init(presenter: presenter, repo: repo, cacheService: cacheService, validator: validator)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        network = nil
        repo = nil
        validator = nil
        presenter = nil
        cacheService = nil
    }
    
    func testLoginInteractor_whenInformationProvided_willValidateEachProperty(){
        
        // Given
        let email = "abc@gmail.com"
        let password = "123456"
        
        // When
        sut.login(email: email, password: password)
        
        // Then
        XCTAssertTrue(validator.isEmailValidated)
        XCTAssertTrue(validator.isPasswordValidated)
    }
    
    func testLoginInteractor_whenInformationValidated_willStartLoading (){
        
        // Given
        let email = "abc@gmail.com"
        let password = "123456"
        
        // When
        sut.login(email: email, password: password)
        
        // Then
        XCTAssertTrue(presenter.isStartLoading)
    }
    
    func testLoginInteractor_whenInformationValidated_willCallLoginApi (){
        
        // Given
        let email = "abc@gmail.com"
        let password = "123456"
        
        // When
        sut.login(email: email, password: password)
        
        // Then
        XCTAssertTrue(repo.isLoginApiCalled)
    }
    
    func testLoginInteractorLogin_whenApiFailed_willGetError (){
        
        // Given
        let email = "abc@gmail.com"
        let password = "123456"
        
        // When
        sut.login(email: email, password: password)
        repo.simulateGettingLoginErrorRespons()
        // Then
        XCTAssertTrue(presenter.isStopLoading)
        XCTAssertTrue(presenter.isFailed)
        XCTAssertEqual(presenter.failerMessage, AppError.noInternet.description)
    }
    
    func testLoginInteractorLogin_whenApiSuccess_willGetDataAndSaveUserData (){
        
        // Given
        let email = "abc@gmail.com"
        let password = "123456"
        
        // When
        sut.login(email: email, password: password)
        repo.simulateGettingLoginSuccessRespons()
        
        // Then
        XCTAssertTrue(presenter.isStopLoading)
        XCTAssertTrue(presenter.isSuccess)
        XCTAssertEqual(presenter.successMessage, "true")
        XCTAssertNotNil(cacheService.userData)
    }
    
    
    
}
