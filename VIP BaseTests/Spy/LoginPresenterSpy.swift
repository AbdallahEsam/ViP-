//
//  LoginPresenterSpy.swift
//  VIP BaseTests
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
@testable import VIP_Base

class LoginPresenterSpy: LoginPresenterProtocol {
    var view: LoginViewProtocol?
    
    var successMessage: String?
    var isSuccess: Bool = false
    var failerMessage: String?
    var isFailed: Bool = false
    var isStartLoading: Bool = false
    var isStopLoading: Bool = false
    
    
    func showAlert(with message: String, title: AllertThemes) {
        if title == .success {
            isSuccess = true
            successMessage = message
        }else if title == .error {
            isFailed = true
            failerMessage = message
        }
    }
    
    func startLoading() {
        isStartLoading = true
    }
    
    func stopLoading() {
        isStopLoading = true
    }
    

}
