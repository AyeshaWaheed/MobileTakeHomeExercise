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

extension TrendModel: Equatable {
    static var mocked: TrendModel  {
        return TrendModel(items: [
            ItemModel(name: "go", description: "The Go programming language", language: "Go", stargazers_count: 100876, owner: OwnerModel(login: "golang", avatar_url: "https://avatars.githubusercontent.com/u/4314092?v=4")),
            ItemModel(name: "ant-design", description: "An enterprise-class UI design language and React UI library", language: "TypeScript", stargazers_count: 80794, owner: OwnerModel(login: "ant-design", avatar_url: "https://avatars.githubusercontent.com/u/12101536?v=4")),
            ItemModel(name: "swift", description: "The Swift Programming Language", language: "C++", stargazers_count: 59916, owner: OwnerModel(login: "apple", avatar_url: "https://avatars.githubusercontent.com/u/10639145?v=4"))
        ])
    }
}
