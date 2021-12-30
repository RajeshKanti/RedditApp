//
//  BaseViewModel.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-29.
//

import Foundation

typealias EmptyClosures = (() -> ())
typealias SuccessClosure = (Bool) -> ()
typealias ErrorClosure = (String) -> ()
typealias Success = (Bool) -> ()

class BaseViewModel {
    public var refreshData: EmptyClosures?
    public var showError: ErrorClosure?
}
