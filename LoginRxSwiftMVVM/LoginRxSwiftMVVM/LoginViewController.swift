//
//  LoginViewController.swift
//  LoginRxSwiftMVVM
//
//  Created by Atif on 06/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var textFldEmail: UITextField!
    @IBOutlet weak var textFldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var loginViewModel = LoginViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        rxBinding()
    }
    
    func rxBinding() {
        _ = textFldEmail.rx.text.map {$0 ?? ""}.bind(to: loginViewModel.email)
        _ = textFldPassword.rx.text.map {$0 ?? ""}.bind(to: loginViewModel.password)
        _ = loginViewModel.isValid.bind(to: btnLogin.rx.isEnabled)
        loginViewModel.isValid.subscribe(onNext: {[weak self] isValid in
            self?.btnLogin.alpha = isValid ? 1 : 0.4
            self?.btnLogin.isEnabled = isValid
            print(isValid)
            }, onError: { error in
                print(error)
        }, onCompleted: {
            print("complete")
        }).disposed(by: disposeBag)
    }

    @IBAction func actionResignKeyboard(_ sender: Any) {
        dismissKeybaord()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        dismissKeybaord()
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        appDelegate().window?.rootViewController = vc
    }
    
    func dismissKeybaord() {
        textFldEmail.resignFirstResponder()
        textFldPassword.resignFirstResponder()
    }
}

