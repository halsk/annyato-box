//
//  PAPProfileChildView.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPProfileChildView.h"

@implementation PAPProfileChildView

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
}

+ (instancetype)view
{
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}


@end
