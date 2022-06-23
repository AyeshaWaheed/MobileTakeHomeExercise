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
//    func cellUpdate()
    var showLanguageView: ((Bool)->())? { get set }
//    var tableViewUpdate: (()->())? { get set }
}

class TrendingRepositoryTableViewCellViewModel: TrendingRepositoryTableViewCellViewModelType {
    
    //MARK: - Properties
    
    private let itemModel: ItemModel
    
    var showLanguageView: ((Bool)->())?
//    var tableViewUpdate: (()->())?
    
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
        showLanguageView?(language?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? false)
        return language ?? ""
    }
    
    func getStarCount() -> String {
        "\(itemModel.stargazers_count)"
    }
    
//    func cellUpdate() {
//        tableViewUpdate?()
//    }
    
}
