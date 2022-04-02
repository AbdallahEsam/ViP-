//
//  HandleResponseError.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import Foundation

protocol HandleResponseError {
    func handleErrorResponse(error: AppError, view: AlertHandlerViewProtocol)
}

extension HandleResponseError {
    
    func handleErrorResponse( error: AppError, view: AlertHandlerViewProtocol) {
        switch error {
        case .cannotDecode:
            view.showAlert(with: error.description, title: .error)
        case .noInternet:
            view.showAlert(with: error.description, title: .error)
        case .error(let error):
            view.showAlert(with: error, title: .error)
        case .tokenExpire:
            view.showAlert(with: error.description, title: .error)
        case .internalServerError:
            view.showAlert(with: error.description, title: .error)
        case .timeOut:
            view.showAlert(with: error.description, title: .error)
        }
    }
}
