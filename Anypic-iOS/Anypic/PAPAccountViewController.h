//
//  PAPAccountViewController.h
//  Anypic
//
//  Created by Héctor Ramos on 5/3/12.
//

#import "PAPPhotoTimelineViewController.h"
#import "PAPUserProfileView.h"

@interface PAPAccountViewController : PAPPhotoTimelineViewController<PAPUserProfileViewDelegate>

@property (nonatomic, strong) PFUser *user;

@end
