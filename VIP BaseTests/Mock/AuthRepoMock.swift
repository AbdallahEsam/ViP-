//
//  AuthRepoMock.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base
class AuthRepoMock {
    let network: NetworkProtocol
    var isLoginApiCalled: Bool =  false
    init(network: NetworkSpy) {
        self.network = network
    }
    
    var compeletion: NetworkCompletion<LoginModel>?
//    ((AppResponse<LoginModel>) -> Void)?
    
    // MARK: - Mock Behaviour
    
    private func loginSuccessResponsStub() -> LoginModel {
        return UserStubs.createUser()
    }
    
   
    func simulateGettingLoginSuccessRespons() {
        compeletion?(.success(loginSuccessResponsStub()))
    }
    
    func simulateGettingLoginErrorRespons() {
        compeletion?(.failure(.noInternet))
    }
    
}
extension AuthRepoMock: AuthRepoProtocol{
    func login(email: String, passowrd: String, handler: @escaping NetworkCompletion<LoginModel>) {
        isLoginApiCalled = true
        self.compeletion = handler
    }
}
