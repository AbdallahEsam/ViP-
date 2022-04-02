//
//  LoginInteractor.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation
protocol LoginInteractorProtocol {
    func login(email: String?, password: String?)
}

class LoginInteractor{
    
    private let repo: AuthRepoProtocol
    private var presenter: LoginPresenterProtocol
    private var cacheService: CacheServiceProtocol
    private var validator: ValidatorProtocol
    
    init(presenter: LoginPresenterProtocol, repo: AuthRepoProtocol, cacheService: CacheServiceProtocol, validator: ValidatorProtocol) {
        self.presenter = presenter
        self.repo = repo
        self.cacheService = cacheService
        self.validator = validator
    }
    
    private func validate(_ email: String?, _ password: String?) -> Bool {
        do{
            try validator.validateMail(with: email)
            try validator.validatePassword(with: password, minCount: 6)
            return true
        }catch let error as ValidatorError {
            self.presenter.showAlert(with: error.associatedMessage, title: .warning)
            return false
        } catch {
            return false
        }
    }
    
}

extension LoginInteractor: LoginInteractorProtocol {
    func login(email: String?, password: String?) {
        if validate(email, password) {
            callRepoLogin(email: email, password: password)
        }
    }
}

extension LoginInteractor: HandleResponseError {
    private func callRepoLogin(email: String?, password: String?){
        presenter.startLoading()
        repo.login(email: email!, passowrd: password!) { [weak self] response in
            guard let self = self else{return}
            self.presenter.stopLoading()
            switch response {
            case .success(let data):
                self.cacheService.setUserData(data.data)
                self.presenter.showAlert(with: data.msg ?? "", title: .success)
            case .failure(let error):
                self.handleErrorResponse(error: error, view: self.presenter)
            }
        }
    }
}
