//
//  HandleResponseError.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

protocol LoaderViewProtocol: AnyObject {
    func startLoading()
    func stopLoading()
}

extension LoaderViewProtocol where Self: UIViewController {

    func startLoading(){
        let loader = LoadingView.shared
        view.addSubview(loader)
        view.bringSubviewToFront(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        loader.activityIndicator.startAnimating()
    }
    
    func stopLoading(){
        let loader = LoadingView.shared
        loader.removeFromSuperview()
    }
}

class LoadingView: UIView {
    
     var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tintColor = .white
        activityIndicator.color = .white
        return activityIndicator
    }()
    
    private init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        addSubview(activityIndicator)
        backgroundColor = .clear
        activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let shared = LoadingView()
}
