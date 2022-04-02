//
//  AuthRepo.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//


import Foundation
protocol AuthRepoProtocol: AnyObject {
    func login(email: String, passowrd: String, handler: @escaping NetworkCompletion<LoginModel>)
    var network: NetworkProtocol {get}
}

class AuthRepo {
    
     let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        
        self.network = network
    }
    
    
}

extension AuthRepo: AuthRepoProtocol {
    
    func login(email: String, passowrd: String, handler: @escaping  NetworkCompletion<LoginModel>) {
        
        network.request(AuthRouter.login(email: email, password: passowrd), decodeTo: LoginModel.self, completionHandler: handler)
    }

}
