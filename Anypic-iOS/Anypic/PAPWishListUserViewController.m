//
//  PAPWishListUserViewController.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/14/14.
//
//

#import "PAPWishListUserViewController.h"
#include "PAPWishlistUserCell.h"
#include "PAPCategeoryViewController.h"

@interface PAPWishListUserViewController ()

@end

@implementation PAPWishListUserViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        // The className to query on
        //self.className = kPAPInstallationUserKey;
        self.className  = @"User";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 10;
        
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated] ;
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
        cell = [[PAPWishlistUserCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell.photoButton addTarget:self action:@selector(didTapOnCategoryAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    cell.photoButton.tag = indexPath.row;
    cell.imageView.image = [UIImage imageNamed:@"PlaceholderPhoto.png"];
    cell.imageView.file = [object objectForKey:kPAPUserProfilePicSmallKey];
    cell.textLabel.text = [object objectForKey:kPAPUserDisplayNameKey];
    cell.detailTextLabel.text = [object objectForKey:kPAPUserProfileText];
    
    // PFQTVC will take care of asynchronously downloading files, but will only load them when the tableview is not moving. If the data is there, let's load it right away.
    if ([cell.imageView.file isDataAvailable]) {
        [cell.imageView loadInBackground];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    PFUser *user = [self.objects objectAtIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PAPCategeoryViewController *controller = [[PAPCategeoryViewController alloc] initWithUser:user];
    [self.navigationController pushViewController:controller animated:YES];
}



- (PFQuery *)queryForTable{
    return [PFUser query];
}


@end
