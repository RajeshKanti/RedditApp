//
//  DetailsViewController.m
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-29.
//

#import "DetailsViewController.h"
#import "RedditApp-Swift.h"

@interface DetailsViewController ()

//@IBOutlet weak var voteCountLabel: UILabel!
//@IBOutlet weak var postTimeLabel: UILabel!
//@IBOutlet weak var pictureLabel: UILabel! {
//    didSet {
//        pictureLabel.textColor = .white
//        pictureLabel.backgroundColor = .purple
//        pictureLabel.layer.masksToBounds = true
//        pictureLabel.layer.cornerRadius = pictureLabel.frame.height / 2
//    }
//}
//@IBOutlet weak var postTitleLabel: UILabel!
//@IBOutlet weak var postImageView: UIImageView!
//
//@IBOutlet weak var commentsButton: UIButton!
//@IBOutlet weak var shareButton: UIButton!
//@IBOutlet weak var saveButton: UIButton!

@property (weak, nonatomic) IBOutlet UILabel *voteCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *discussionLabel;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postDescLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UIButton *commentsButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupData];
}


- (void) setupData {
    
    _voteCountLabel.text = [NSString stringWithFormat:@"%ld", (long)_detailsModel.upVoteCount];
    _postTimeLabel.text = [NSString stringWithFormat:@"Posted by %@", _detailsModel.authorFullName];
    _postTitleLabel.text = _detailsModel.title;
    _postDescLabel.text = _detailsModel.postDesc;
    [_commentsButton setTitle:[NSString stringWithFormat:@"%ld Comments", (long)_detailsModel.commentsCount] forState:UIControlStateNormal];
    
    _discussionLabel.textColor = [UIColor whiteColor];
    _discussionLabel.backgroundColor = [UIColor purpleColor];
    _discussionLabel.layer.masksToBounds = YES;
    _discussionLabel.layer.cornerRadius = _discussionLabel.frame.size.height / 2;
    
    if (_detailsModel.imageUrl != nil) {
        [_postImageView setHidden:NO];
        NSURL *url = [NSURL URLWithString:_detailsModel.imageUrl];
        _postImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    } else {
        [_postImageView setHidden:YES];
    }

}

//-(void) downloadImageFromUrl {
//
//    if (_detailsModel.imageUrl != nil) {
//        NSString *strImgURLAsString = _detailsModel.imageUrl;
////        [strImgURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//
//        NSURLSessionTask
//
//        NSURL *imgURL = [NSURL URLWithString:strImgURLAsString];
//        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//            if (!connectionError) {
//                UIImage *img = [[UIImage alloc] initWithData:data];
//                // pass the img to your imageview
//            }else{
//                NSLog(@"%@",connectionError);
//            }
//        }];
//
//    }
//}


//func setImageFromUrl(ImageURL :String) {
//    URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
//        (data, response, error) -> Void in
//        DispatchQueue.main.async {
//            if let data = data {
//                self.postImageView.image = UIImage(data: data)
//            }
//        }
//    }).resume()
//}

@end
