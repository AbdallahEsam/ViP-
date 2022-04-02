//
//  LoginViewController.swift
//  VIP Base
//
//  Created by Abdallah Esam on 11/1/2022.
//  Copyright © 2021 Abdallah Esam. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: LoaderViewProtocol, AlertHandlerViewProtocol {
    
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var emailTF: UITextField!
    @IBOutlet weak private var passwordTF: UITextField!
    @IBOutlet weak private var loginBtn: MainButton!
    @IBOutlet weak private var welcomeLabel: UILabel!

    var interactor: LoginInteractorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.makeItEnable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        emailTF.becomeFirstResponder()
    }
    
    
    @IBAction func loginBtnSelected() {
        view.endEditing(true)
        interactor?.login(email: emailTF.text, password: passwordTF.text)
    }
  
}

extension LoginViewController: LoginViewProtocol {
    
    func startLoading() {
        loginBtn.showLoading(lock: true)
    }
    
    func stopLoading() {
        loginBtn.stopLoading()
    }
    
   
}
