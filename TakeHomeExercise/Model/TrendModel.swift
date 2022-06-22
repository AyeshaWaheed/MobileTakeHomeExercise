//
//  TrendModel.swift
//  TakeHomeExercise
//
//  Created by Ayesha on 21/06/2022.
//

import Foundation

struct TrendModel: Decodable {
    let items: [ItemModel]
}

//MARK: - Mocked Data

extension TrendModel {
    static var mocked: TrendModel  {
        return TrendModel(items: [
            ItemModel(name: "go", description: "The Go programming language", language: "Go", stargazers_count: 100876, owner: OwnerModel(login: "golang", avatar_url: "https://avatars.githubusercontent.com/u/4314092?v=4")),
            ItemModel(name: "go", description: "The Go programming language", language: "Go", stargazers_count: 100876, owner: OwnerModel(login: "golang", avatar_url: "https://avatars.githubusercontent.com/u/4314092?v=4")),
            ItemModel(name: "go", description: "The Go programming language", language: "Go", stargazers_count: 100876, owner: OwnerModel(login: "golang", avatar_url: "https://avatars.githubusercontent.com/u/4314092?v=4"))
        ])
    }
}
