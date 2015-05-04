//
//  groupCellView.h
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupCellView : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *groupImageThumnail;
@property (weak, nonatomic) IBOutlet UITextView *groupTitle;

@property (weak, nonatomic) IBOutlet UITextView *groupIntro;
@property (weak, nonatomic) IBOutlet UIImageView *groupLikeThumnail;
@property (weak, nonatomic) IBOutlet UITextView *groupMember;
@end
