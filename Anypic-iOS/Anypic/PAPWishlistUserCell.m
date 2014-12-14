//
//  PAPWishlistUserCell.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPWishlistUserCell.h"

@implementation PAPWishlistUserCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.clipsToBounds = NO;
        
        self.imageView.frame = CGRectMake( 20.0f, 5.0f, 50.0f, 50.0f);
        self.imageView.backgroundColor = [UIColor whiteColor];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        self.detailTextLabel.frame = CGRectMake( 95.0f, 80.0f, 210.0f, 50.0f);
        self.photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.photoButton.frame = CGRectMake( 20.0f, 5.0f, 50.0f, 50.0f);
        self.photoButton.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.photoButton];
        
        [self.contentView bringSubviewToFront:self.imageView];
    }
    
    return self;
}


#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake( 20.0f, 5.0f, 50.0f, 50.0f);
    self.photoButton.frame = CGRectMake( 20.0f, 5.0f, 50.0f, 50.0f);
    self.detailTextLabel.frame = CGRectMake( 95.0f, 80.0f, 210.0f, 50.0f);

}

@end
