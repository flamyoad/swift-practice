//
//  AuthService.swift
//  dodoco
//
//  Created by Zhen Hao Ng on 12/03/2022.
//

import Foundation
import Alamofire

protocol AuthService {
    func login(username: String, password: String, completion: @escaping (UserInfo?) -> Void)
}

class AuthServiceImpl: AuthService {
    func login(username: String, password: String, completion: @escaping (UserInfo?) -> Void) {
        if (username.isEmpty || password.isEmpty) {
            completion(nil)
        }
        let loginEndpoint = NetworkRequestManager.BASE_URL + "users/" + username
        AF.request(loginEndpoint, method: .get, encoding: JSONEncoding.default)
            .responseDecodable(of: UserInfo.self) { (response) in
                guard let userInfo = response.value else {
                    completion(nil)
                    return
                }
                completion(userInfo)
            }
    }
}
