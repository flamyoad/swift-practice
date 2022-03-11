//
//  DependencyProvider.swift
//  dodoco
//
//  Created by Zhen Hao Ng on 13/03/2022.
//

import Foundation
import Swinject

// todo: Try SwinjectAutoRegistration
class DependencyProvider {
    let container = Container()
    let assember: Assembler
    
    init() {
        assember = Assembler([
            ServiceAssembly()
        ],
        container: container)
    }
}
