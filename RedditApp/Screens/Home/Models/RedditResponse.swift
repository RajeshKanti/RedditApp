//
//  RedditResponse.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-27.
//

import Foundation

struct RedditResponse: Codable {
    let kind: String
    let data: RedditData
}

struct RedditData: Codable {
    
    let after: String?
    let dist: Int
    let children: [RedditDict]
}

struct RedditDict: Codable {
    let data: Reddit
}

struct Reddit: Codable {
        
    let authorFullName: String?
    let title: String?
    let createdUtcTime: Int?
    let iconUrl: String?
    let commentsCount: Int?
    let upVotes: Int?
    let postDesc: String?
    let fullIconUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case authorFullName = "author_fullname"
        case title = "title"
        case createdUtcTime = "created_utc"
        case iconUrl = "thumbnail"
        case commentsCount = "num_comments"
        case upVotes = "ups"
        case postDesc = "description"
        case fullIconUrl = "url"
    }
}
