//
//  HomeViewModel.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-25.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    private var apiService : APIService!
    var selectedRedditModel: Reddit?
    
    private(set) var redditResponse: RedditResponse? {
        didSet {
            self.refreshData?()
        }
    }
    
    var bindHomeViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        self.getRedditData()
    }
    
    func getRedditData() {
        self.apiService.getRedditData(completion: { response, error  in
            
            if let _ = response {
                self.redditResponse = response
            } else {
                self.showError?(error?.localizedDescription ?? "")
            }
        })
    }
}
