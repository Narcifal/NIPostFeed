//
//  NIPostDetails.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation

struct NIPostDetails: Codable {
    let post: NIPostDetail
}

struct NIPostDetail: Codable {
    let postId: Int
    let timeshamp: TimeInterval
    let title: String
    let text: String
    let likesCount: Int
    let postImage: String
    
    enum CodingKeys: String, CodingKey {
        case postId
        case timeshamp
        case title
        case text
        case postImage
        case likesCount = "likes_count"
    }
}
