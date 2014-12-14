//
//  PAPWishListUserViewController.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPWishListUserViewController.h"
#include "PAPWishlistUserCell.h"

@interface PAPWishListUserViewController ()

@end

@implementation PAPWishListUserViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // The className to query on
        self.className = kPAPPhotoClassKey;
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 10;
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.objects.count == 0 ? 1 : self.objects.count;
    return self.objects.count;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

#pragma mark -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"UCell";
    
    PAPWishlistUserCell *cell = (PAPWishlistUserCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PAPWishlistUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.photoButton addTarget:self action:@selector(didTapOnCategoryAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    cell.photoButton.tag = indexPath.row;
    cell.imageView.image = [UIImage imageNamed:@"PlaceholderPhoto.png"];
    cell.imageView.file = [object objectForKey:kPAPPhotoThumbnailKey];
    cell.textLabel.text = [object objectForKey:kPAPPhotoTitleKey];
    
    // PFQTVC will take care of asynchronously downloading files, but will only load them when the tableview is not moving. If the data is there, let's load it right away.
    if ([cell.imageView.file isDataAvailable]) {
        [cell.imageView loadInBackground];
    }
    
    return cell;
}

@end
