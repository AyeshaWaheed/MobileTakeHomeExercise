//
//  TrendingRepositoryTableViewCellViewModel.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 23/06/2022.
//

import Foundation
import UIKit

//MARK: - Protocol

protocol TrendingRepositoryTableViewCellViewModelType {
    func getProfileURL() -> String
    func getOwnerName() -> String
    func getRepositoryName() -> String
    func getRepositoryDescription() -> String
    func getLanguage() -> String
    func getStarCount() -> String
    func showLanguageView() -> Bool
}

class TrendingRepositoryTableViewCellViewModel: TrendingRepositoryTableViewCellViewModelType {
    
    //MARK: - Properties
    
    private let itemModel: ItemModel
    
    //MARK: - Init
    
    init(itemModel: ItemModel) {
        self.itemModel = itemModel
    }
    
    func getProfileURL() -> String {
        itemModel.owner.avatar_url
    }
    
    func getOwnerName() -> String {
        itemModel.owner.login
    }
    
    func getRepositoryName() -> String {
        itemModel.name
    }
    
    func getRepositoryDescription() -> String {
        itemModel.description
    }
    
    func getLanguage() -> String {
        let language = itemModel.language
        return language ?? ""
    }
    
    func getStarCount() -> String {
        "\(itemModel.stargazers_count)"
    }
    
    func showLanguageView() -> Bool {
        itemModel.language?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? false
    }
}
