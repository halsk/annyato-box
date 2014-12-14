//
//  PAPProfileEditView.h
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import <UIKit/UIKit.h>

@interface PAPProfileEditView : UIView

@property (nonatomic, weak) IBOutlet UISegmentedControl* generation;
-(IBAction)changedGeneration:(UISegmentedControl*)sender;
-(IBAction)pressAddChild:(id)sender;
-(void)setChangedGenerationAction:(void (^)(int generation))block;

+ (instancetype)view;

@end
