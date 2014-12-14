//
//  PAPProfileEditView.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPProfileEditView.h"


@interface PAPProfileEditView ()
@property (copy) void (^changedGenerationBlock)(int);
@end

@implementation PAPProfileEditView

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
-(IBAction)changedGeneration:(UISegmentedControl*)sender{
    self.changedGenerationBlock(sender.selectedSegmentIndex);
}
-(IBAction)pressAddChild:(id)sender{
    
}
-(void)setChangedGenerationAction:(void (^)(int generation))block{
    self.changedGenerationBlock = block;
}

+ (instancetype)view
{
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

@end
