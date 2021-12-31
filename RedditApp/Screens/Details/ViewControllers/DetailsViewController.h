//
//  DetailsViewController.h
//  RedditApp
//
//  Created by Rajesh Ghosh on 2021-12-29.
//

#import <UIKit/UIKit.h>
@class RedditDetailsModel;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) RedditDetailsModel *detailsModel;

@end

NS_ASSUME_NONNULL_END

