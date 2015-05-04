//
//  groupDetailViewController.m
//  HackUp
//
//  Created by Zhuotao Liu on 4/27/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import "groupDetailViewController.h"
#import "memberFaceCollectionCell.h"

@interface groupDetailViewController () <UICollectionViewDataSource>

@end

@implementation groupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateView];
    // Do any additional setup after loading the view.
}

- (void)updateView {
    self.joinButton.layer.borderColor = [UIColor redColor].CGColor;
    self.followButton.layer.borderColor = [UIColor redColor].CGColor;
    self.groupDescriptionView.text = self.groupInfo;
    self.groupFaceView.image = self.groupImage;
    self.groupTitleView.text = self.groupTitle;
    self.groupTitleView.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.memberCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"memberFaceCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[memberFaceCollectionCell class]]) {
        memberFaceCollectionCell *faceCell = (memberFaceCollectionCell *)cell;
        faceCell.memberFaceImageView.image = [UIImage imageNamed:@"person.png"];
        
    }
    return cell;
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
