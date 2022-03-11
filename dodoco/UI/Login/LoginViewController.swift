//
//  ViewController.swift
//  dodoco
//
//  Created by Zhen Hao Ng on 11/03/2022.
//

import UIKit
import Alamofire
import RxSwift

class LoginViewController: BaseViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUi()
        bindViewModel()
    }
    
    private func initUi() {
        imageLogo.image = UIImage(named: "RedditLogo")
    }
    
    private func bindViewModel() {
        viewModel.loginSuccess
            .subscribe(
                onNext: { [weak self] isLoginSuccess in
                    if (isLoginSuccess) {
                        
                    } else {
                        self?.showErrorDialog()
                    }
                }
            )
            .disposed(by: disposeBag)
    }
    
    private func showErrorDialog() {
        let alert = UIAlertController(title: "Error", message: "Failed to log in", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    @IBAction func loginClick(_ sender: Any) {
        guard let userName = usernameTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        viewModel.login(userName: userName, password: password)
    }
}

