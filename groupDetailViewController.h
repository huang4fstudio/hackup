//
//  groupDetailViewController.h
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupDetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *groupFaceView;
@property (strong, nonatomic) UIImage *groupImage;

@property (weak, nonatomic) IBOutlet UITextView *groupTitleView;
@property (strong, nonatomic) NSString *groupTitle;

@property (weak, nonatomic) IBOutlet UICollectionView *memberFaceCollectionView;
@property (nonatomic) NSInteger memberCount;

@property (weak, nonatomic) IBOutlet UITextView *groupDescriptionView;
@property (strong, nonatomic) NSString *groupInfo;

@end
