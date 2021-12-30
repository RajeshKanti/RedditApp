//
//  AlertUtility.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-29.
//

import Foundation

class AlertUtility {
    
    typealias CompletionHandler = ((UIAlertAction, Int) -> (Void))
    
    private static func createActionController(_ prerredStyle: UIAlertController.Style, title: String?, message: String?, buttonTitles: [String], completionHandler: CompletionHandler?) -> UIAlertController {
        
            let title = title ?? NSLocalizedString("", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: prerredStyle)
        
        //Add buttons to the alert
        for (index, buttonTitle) in buttonTitles.enumerated() {
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: {(action) in
                completionHandler?(action, index)
            })
            alert.addAction(action)
        }
        
        return alert
    }
    
    public static func showAlert(_ viewController: UIViewController, title: String?, message: String?, buttonTitles:[String], completionHandler: CompletionHandler?) {
        
        let alert = createActionController(.alert, title: title, message: message, buttonTitles: buttonTitles, completionHandler: completionHandler)
        
        viewController.present(alert, animated: true, completion: nil)
    }
}
