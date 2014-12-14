//
//  PAPCategeoryViewController.m
//  Anypic
//
//  Created by Haruyuki Seki on 12/13/14.
//
//


#import "PAPCategeoryViewController.h"
#import "PAPCategoryCell.h"
#import "PAPPhotoTimelineViewController.h"

@interface PAPCategeoryViewController ()
@property (nonatomic, assign) BOOL shouldReloadOnAppear;
@property (nonatomic, strong) NSMutableSet *reusableSectionHeaderViews;
@property (nonatomic, strong) NSMutableDictionary *outstandingSectionHeaderQueries;
@property (nonatomic, assign) PFUser *selecteduser;
@end

@implementation PAPCategeoryViewController
@synthesize reusableSectionHeaderViews;
@synthesize shouldReloadOnAppear;
@synthesize outstandingSectionHeaderQueries;
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:PAPCategoryViewControllerCategoryDidLoadNotification object:nil];

}
- (id)initWithUser:(PFUser *)user{
    self = [self initWithStyle:UITableViewCellStyleDefault];
    self.selecteduser = user;
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.outstandingSectionHeaderQueries = [NSMutableDictionary dictionary];
        
        // The className to query on
        self.className = kPAPCategoryClassKey;
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 10;
        
        // Improve scrolling performance by reusing UITableView section headers
        self.reusableSectionHeaderViews = [NSMutableSet setWithCapacity:3];
        
        self.shouldReloadOnAppear = NO;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(categoriesDidLoad:) name:PAPCategoryViewControllerCategoryDidLoadNotification object:nil];

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.shouldReloadOnAppear) {
        self.shouldReloadOnAppear = NO;
        [self loadObjects];
    }
}
#pragma mark -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"CCell";
    
    PAPCategoryCell *cell = (PAPCategoryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PAPCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.photoButton addTarget:self action:@selector(didTapOnCategoryAction:) forControlEvents:UIControlEventTouchUpInside];
    }
        
    cell.photoButton.tag = indexPath.row;
    cell.imageView.image = [UIImage imageNamed:@"PlaceholderPhoto.png"];
    cell.imageView.file = [object objectForKey:kPAPCategoryPictureKey];
    cell.textLabel.text = [object objectForKey:kPAPCategoryNameKey];
        
    // PFQTVC will take care of asynchronously downloading files, but will only load them when the tableview is not moving. If the data is there, let's load it right away.
    if ([cell.imageView.file isDataAvailable]) {
        [cell.imageView loadInBackground];
    }
        
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self didTapOnCategory:indexPath];
}
- (void)didTapOnCategoryAction:(UIButton *)sender {
    [self didTapOnCategory:sender.tag];
}
- (void)didTapOnCategory:(int)categoryid{
    PAPPhotoTimelineViewController *photoTimelineVC = [[PAPPhotoTimelineViewController alloc] initWithCategoryId:categoryid];
    [self.navigationController pushViewController:photoTimelineVC animated:YES];
}

@end
