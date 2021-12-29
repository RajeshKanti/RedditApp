//
//  APIService.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-27.
//

import Foundation


class APIService: NSObject {
    
    private let sourcesURL = URL(string: "https://www.reddit.com/.json")!
    
    func getRedditData(completion : @escaping (RedditResponse) -> ()) {
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            
            guard let responseData = data else {
                return
            }
            
            do {
                let redditData = try JSONDecoder().decode(RedditResponse.self, from: responseData)
                completion(redditData)

                let jsonDict = try! JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                print(jsonDict)

            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
