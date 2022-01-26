# RedditApp

iOS Developer Assignment
Build an iOS application that will show the “Home” page of Reddit (https://www.reddit.com). User should be able to tap on each post which takes them to the post’s details page.
 
Home Screen
The Home screen of the app should display Reddit posts in either a UITableView or a UICollectionView. You can make a network request to https://www.reddit.com/.json in order to get the Home screen content in JSON format. Each post cell should display a post title, a number upvotes/likes (just the number) and a number of comments for that post. Refer to the image above, it highlights all the items that the cells should contain.
•	If a post contains an image, you should display that image and ensure that the post cell is resized accordingly to accommodate the image size (preserve the aspect ratio of the image).
•	If a post does not contain an image, just show the post’s title, number of upvotes/likes (just the number), and the number of comments.
Post cells should have dynamic sizes in order to accommodate the content they are displaying.
Details Screen
The Details screen should display the post’s image (if it exists), title, body, number of upvotes/likes (just the number) and the number of comments for the post that user tapped on in the Home screen. If the post contains an image, that image should be displayed in its full size (preserve the aspect ratio of the image). User should also be able to navigate back to the Home screen.
The design of your application does not need to match the screenshots in the image attached above.
One of these screens (Home or Details) has to be done in Objective-C, the other with Swift.
The architecture of classes, models and flows of data are completely up to you, but you will be asked to explain your decisions. You are also totally free to use any design pattern (e.g. MVC, MVVM). Do not over engineer this app, but make sure the source code is maintainable and readable. During the interview you will be asked to build a new feature for this app. Try to write everything without using any 3rd party libraries. If you do decide on using a 3rd party library, you will be asked your reasoning behind that decision.
Acceptance Criteria
•	An application that makes a request to https://www.reddit.com/.json, decodes the response into some kind of data structure(s) that you’ve defined, which can later be used to layout the UITableViewCell / UICollectionViewCell’s and also the Details screen. 
•	You’ve implemented basic error handling.
•	One of the screens is done in Objective-C.
•	You’ve used Auto Layout.
•	The final project is either zipped or uploaded to a GIT repo and shared with Havas.
