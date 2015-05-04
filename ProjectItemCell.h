//
//  ProjectItemCell.h
//  HackUp
//
//  Created by Zhuotao Liu on 4/9/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UITextView *projectTitle;
@property (weak, nonatomic) IBOutlet UITextView *projectIntro;
@end
