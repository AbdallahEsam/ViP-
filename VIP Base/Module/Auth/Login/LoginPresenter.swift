//
//  LoginPresenter.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation

protocol LoginPresenterProtocol: AlertHandlerViewProtocol, LoaderViewProtocol {
  
}

class LoginPresenter {
    private weak var view: LoginViewProtocol?
    init(view: LoginViewProtocol) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterProtocol, HandleResponseError {
   
    func showAlert(with message: String, title: AllertThemes) {
        view?.showAlert(with: message, title: title)
    }
    
    func startLoading() {
        view?.startLoading()
    }
    
    func stopLoading() {
        view?.stopLoading()
    }
    
    
}
