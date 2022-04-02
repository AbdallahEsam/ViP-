//
//  AuthConfigurator.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit
struct AuthConfigurator {
    
    static func login() ->  UIViewController{
        let network = Network()
        let mainRepo = AuthRepo(network: network)
        let cacheService: CacheServiceProtocol = CacheService()
        let validator: ValidatorProtocol = Validator()
        let view = LoginViewController()
        let presenter: LoginPresenterProtocol = LoginPresenter(view: view)
        let interactor: LoginInteractorProtocol = LoginInteractor(presenter: presenter, repo: mainRepo, cacheService: cacheService, validator: validator)
        view.interactor = interactor
        return view
    }
    
}
