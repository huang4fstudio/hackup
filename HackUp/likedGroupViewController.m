//
//  likedGroupViewController.m
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import "likedGroupViewController.h"
#import "groupCellView.h"
#import "groupDetailViewController.h"
#import <Parse/Parse.h>

@interface likedGroupViewController () <UICollectionViewDataSource>
@property (strong, nonatomic) NSArray* a;
@end

@implementation likedGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFQuery queryWithClassName:@"Group"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            // Do something with the found objects
            self.a = objects;
            [self.likedGroupCollectionView reloadItemsAtIndexPaths:[self.likedGroupCollectionView indexPathsForVisibleItems]];
            [self.likedGroupCollectionView reloadData];
        } else {
           
        }
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"groupCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[groupCellView class]]) {
        groupCellView *groupCell = (groupCellView *)cell;
        
        // API goes here. The followings are hard coded by me
        
        groupCell.groupImageThumnail.image = [UIImage imageNamed:@"placeholder4.png"];
        PFObject* p = self.a[indexPath.row];
        
        groupCell.groupTitle.text = p[@"Name"];//[@"Group " stringByAppendingString:[NSString stringWithFormat: @"%ld", (long)(indexPath.row + 1)]];
        if (indexPath.row % 3 == 0) {
            groupCell.groupIntro.text = @"IOS development";
        } else if (indexPath.row % 3 == 1) {
            groupCell.groupIntro.text = @"Android development";
        } else {
            groupCell.groupIntro.text = @"Web development";
        }
        NSInteger randomNumber = arc4random() % 5 + 1;
        groupCell.groupMember.text = [[NSString stringWithFormat: @"%ld", (long)randomNumber] stringByAppendingString:@" Members"];
        
        groupCell.groupLikeThumnail.image = [UIImage imageNamed:@"favourite_fill.png"];
        
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc]                                                              initWithTarget:self action:@selector(likedTap:)];
        
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [groupCell.groupLikeThumnail addGestureRecognizer:singleTapGestureRecognizer];
        
    }
    return cell;
}

-(void) likedTap:(UITapGestureRecognizer *)sender
{
    //NSLog(@"Touched");
    CGPoint tapLocation = [sender locationInView:self.likedGroupCollectionView];
    NSIndexPath *indexPath = [self.likedGroupCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        //NSLog(@"got");
        UICollectionViewCell *cell = [self.likedGroupCollectionView cellForItemAtIndexPath:indexPath];
        if ([cell isKindOfClass:[groupCellView class]]) {
            groupCellView *groupCell = (groupCellView *)cell;
            // flip like and unlike: need APIs to check the current status
            groupCell.groupLikeThumnail.image = [UIImage imageNamed:@"favourite_fill.png"];
            
            // Talk to the backend for updating things
        }
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UICollectionViewCell class]]) {
        NSIndexPath *indexpath = [self.likedGroupCollectionView indexPathForCell:sender];
        if (indexpath) {
            if ([segue.identifier isEqualToString:@"showLikedGroup"]) {
                if ([segue.destinationViewController isKindOfClass:[groupDetailViewController class]]) {
                    groupDetailViewController *groupDetailView = (groupDetailViewController *) segue.destinationViewController;
                    
                    // This should be from the API
                    groupDetailView.groupTitle = @"CS465 Project Group";
                    groupDetailView.groupInfo = @"We are a group working on CS465 class project. We are composed by 5 members in areas of HCI, software development and UI/UX. Our project is about building an app to help people meetup to form a group working a certain project. If you like, please follow our project. ";
                    groupDetailView.memberCount = 10;
                    groupDetailView.groupImage = [UIImage imageNamed:@"placeholder2.png"];
                }
            }
        }
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
