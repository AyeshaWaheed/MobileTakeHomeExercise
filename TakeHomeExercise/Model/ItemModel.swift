//
//  ItemModel.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 22/06/2022.
//

import Foundation

struct ItemModel: Decodable, Equatable {
    let name: String
    let description: String
    let language: String?
    let stargazers_count: Int
    let owner: OwnerModel
}

