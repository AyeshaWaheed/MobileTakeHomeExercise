//
//  RepositoryDescriptionViewModel.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 06/07/2022.
//

import Foundation

protocol RepositoryDescriptionViewModelType {
    func getRepositoryDescription() -> String
}

class RepositoryDescriptionViewModel: RepositoryDescriptionViewModelType {
    
    private let repositoryDescription: String
    
    init(repositoryDescription: String) {
        self.repositoryDescription = repositoryDescription
    }
    
    func getRepositoryDescription() -> String {
        repositoryDescription
    }
}
