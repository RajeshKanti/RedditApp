//
//  HomeViewModel.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-25.
//

import Foundation

class HomeViewModel {
    
    private var apiService : APIService!
    private(set) var redditResponse : RedditResponse? {
        didSet {
            self.bindHomeViewModelToController()
        }
    }
    
    var bindHomeViewModelToController : (() -> ()) = {}
    
    init() {
        self.apiService =  APIService()
        getRedditData()
    }
    
    func getRedditData() {
        self.apiService.getRedditData(completion: { redditResp in
            self.redditResponse = redditResp
        })
    }
}
