//
//  PAPHomeViewController.h
//  Anypic
//
//  Created by Héctor Ramos on 5/3/12.
//

#import "PAPPhotoTimelineViewController.h"
#import "PAPCategeoryViewController.h"

@interface PAPHomeViewController : PAPCategeoryViewController

@property (nonatomic, assign, getter = isFirstLaunch) BOOL firstLaunch;

@end
