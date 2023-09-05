//
//  NIPostList.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

struct NIPostList: Codable {
    let posts: [NIPost]
}

struct NIPost: Codable {
    let postId: Int
    let timeshamp: TimeInterval
    let title: String
    let previewText: String
    let likesCount: Int
    
    enum CodingKeys: String, CodingKey {
        case postId
        case timeshamp
        case title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
