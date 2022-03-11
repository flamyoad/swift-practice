//
//  ServiceAssembly.swift
//  dodoco
//
//  Created by Zhen Hao Ng on 13/03/2022.
//

import Foundation
import Swinject

class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(AuthService.self) { r in
            AuthServiceImpl()
        }.inObjectScope(.container)
    }
}
