//
//  PAPUserProfileView.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPUserProfileView.h"


@implementation PAPUserProfileView
@synthesize delegate;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.label.text = NSStringFromClass([self class]);
}

-(IBAction)editButtonTapped:(id)sender{
    if (delegate){
        [delegate pressEditButton:sender];
    }
}


+ (instancetype)view
{
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}


@end
