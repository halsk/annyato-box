//
//  PAPHomeViewController.h
//  Anypic
//
//  Created by Héctor Ramos on 5/3/12.
//

#import "PAPPhotoTimelineViewController.h"
#import "PAPWishListUserViewController.h"

@interface PAPHomeViewController : PAPWishListUserViewController;

@property (nonatomic, assign, getter = isFirstLaunch) BOOL firstLaunch;

@end
