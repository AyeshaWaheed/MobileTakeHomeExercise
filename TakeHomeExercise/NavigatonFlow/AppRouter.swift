//
//  AppRouter.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 06/07/2022.
//

import Foundation
import UIKit

protocol AppRouterType {
    func open(description: String)
    func close()
}

class AppRouter: AppRouterType {

    private(set) var root: UINavigationController!
    
    init(root: UINavigationController) {
        self.root = root
    }
    
    func open(description: String) {}
    
    func close() {}
}
