//
//  HomeTableViewCell.swift
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-25.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
        
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var pictureLabel: UILabel! {
        didSet {
            pictureLabel.textColor = .white
            pictureLabel.backgroundColor = .purple
            pictureLabel.layer.masksToBounds = true
            pictureLabel.layer.cornerRadius = pictureLabel.frame.height / 2
        }
    }
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    func setupData(cellVM: Reddit) {
        
        voteCountLabel.text = "123"
        postTitleLabel.text = cellVM.title
        
        if let authorFullName = cellVM.authorFullName {
            postTimeLabel.text = "Posted by \(authorFullName)"
        }
        if let url = cellVM.iconUrl {
            postImageView.isHighlighted = false
            setImageFromUrl(ImageURL: url)
        } else {
            postImageView.isHidden = true
        }
        
        if let commentsCount = cellVM.commentsCount {
            commentsButton.setTitle(" \(String(describing: commentsCount)) Comments", for: .normal)
        } else {
            commentsButton.setTitle("0 Comments", for: .normal)
        }
    }
 
          func setImageFromUrl(ImageURL :String) {
             URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                   if let data = data {
                       self.postImageView.image = UIImage(data: data)
                   }
                }
             }).resume()
          }

}
