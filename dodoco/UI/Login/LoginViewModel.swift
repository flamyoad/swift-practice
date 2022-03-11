//
//  LoginViewModel.swift
//  dodoco
//
//  Created by Zhen Hao Ng on 13/03/2022.
//

import Foundation
import RxSwift
import RxRelay

class LoginViewModel {
    let authService = AuthServiceImpl()
    
    let loginSuccess = PublishRelay<Bool>()
    
    func login(userName: String, password: String) {
        authService.login(username: userName, password: password) { [weak self] userInfoRes in
            guard let _ = userInfoRes else {
                self?.loginSuccess.accept(false)
                return
            }
            self?.loginSuccess.accept(true)
        }
    }
}
