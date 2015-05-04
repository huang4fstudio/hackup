//
//  peopleDetailViewController.m
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import "peopleDetailViewController.h"

@interface peopleDetailViewController () <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *peopleInfoTextView;


@end

@implementation peopleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    // Do any additional setup after loading the view.
}

-(void)updateView {
    self.peopleFaceImageView.image = self.faceImage;
    self.peopleNameView.text = self.peopleName;
    self.peopleNameView.textAlignment = NSTextAlignmentCenter;
    self.peopleInfoTextView.text = self.peopleInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
