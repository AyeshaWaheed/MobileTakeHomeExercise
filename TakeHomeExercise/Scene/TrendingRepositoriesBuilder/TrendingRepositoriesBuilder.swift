//
//  TrendingRepositoriesBuilder.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 25/06/2022.
//

import Foundation
import UIKit

final class TrendingRepositoriesBuilder {
    func make()-> UINavigationController {
        let service = TrendService(apiManager: ApiManager())
        let repository = TrendRepository(trendService: service)
        let viewModel = TrendingRepositoriesViewModel(repository: repository)
        let viewController = TrendingRepositoriesViewController(viewModel: viewModel)
        let navigationVC = UINavigationController.withNavigationBar(rootViewController: viewController)
        let router = AppRouter(root: navigationVC)
        viewController.routerDelegate = router
        return navigationVC
    }
}
