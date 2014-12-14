//
//  PAPUserProfileView.h
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import <UIKit/UIKit.h>

@protocol PAPUserProfileViewDelegate
@optional
/*!
 Sent to the delegate when the user button is tapped
 @param user the PFUser associated with this button
 */
- (void)pressEditButton:(id)sender;
@end

@interface PAPUserProfileView : UIView
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *editbutton;
@property (nonatomic,weak) id <PAPUserProfileViewDelegate> delegate;

-(IBAction)editButtonTapped:(id)sender;
+ (instancetype)view;
@end
