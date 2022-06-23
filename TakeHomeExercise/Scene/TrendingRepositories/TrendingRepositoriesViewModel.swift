//
//  TrendingRepositoriesViewModel.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import Foundation

//MARK: - Protocol

protocol TrendingRepositoriesViewModelType {
    func getNavTitle() -> String
    func getTrendingRepositories()
    func setNumberOfRows() -> Int
    func cellForRowAtIndexPath(indexPath: IndexPath) -> TrendingRepositoryTableViewCellViewModelType?
    func prefetchImages()
    var reloadTableView: (()->())? { get set }
}

class TrendingRepositoriesViewModel: TrendingRepositoriesViewModelType {
    
    //MARK: - Properties
    
    private let repository: TrendRepositoryType?
    private var itemModel: [ItemModel] = []
    private var cellViewModels = [TrendingRepositoryTableViewCellViewModelType]()
    
    var reloadTableView: (()->())?
    
    //MARK: - Init
    
    init(repository: TrendRepositoryType) {
        self.repository = repository
    }
    
    func getTrendingRepositories() {
        repository?.fetchCurrentTrend { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let repositories):
                self.itemModel = repositories.items
                self.generateCellViewModels()
            case .failure:
//                network error screen
                ()
            
            }
        }
    }
   
    private func generateCellViewModels() {
        cellViewModels = itemModel.map { TrendingRepositoryTableViewCellViewModel(itemModel: $0)}
        reloadTableView?()
    }
    
    func getNavTitle() -> String {
        "Trending"
    }
    
    func setNumberOfRows() -> Int {
        cellViewModels.count 
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> TrendingRepositoryTableViewCellViewModelType? {
        cellViewModels[indexPath.row]
    }
    
    func prefetchImages() {
        let urls: [URL] = itemModel.compactMap { URL(string: $0.owner.avatar_url) }
        ImageLoadAdapter().prefetchImages(urls: urls)
    }
}