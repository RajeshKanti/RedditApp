//
//  RedditDetailsModel.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-29.
//

import Foundation

@objcMembers public class RedditDetailsModel: NSObject {
    
    var upVoteCount: Int = 0
    var authorFullName: String?
    var title: String?
    var postDesc: String?
    var commentsCount: Int = 0
    var imageUrl: String?
    
}
