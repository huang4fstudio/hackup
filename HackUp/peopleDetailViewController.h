//
//  peopleDetailViewController.h
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface peopleDetailViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextView *peopleNameView;
@property (strong, nonatomic) UIImage *faceImage;
@property (strong, nonatomic) NSString *peopleName;
@property (strong, nonatomic) NSString *peopleInfo;
@property (weak, nonatomic) IBOutlet UIImageView *peopleFaceImageView;
@property (weak, nonatomic) IBOutlet UIButton *invite;

@end
