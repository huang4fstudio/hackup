//
//  InvitationList.m
//  HackUp
//
//  Created by Forrest Huang on 4/5/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

#import "InvitationList.h"
#import "ProjectItemCell.h"
#import "peopleDetailViewController.h"

@interface InvitationList ()

@end

@implementation InvitationList

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"projects" forIndexPath:indexPath];
    if ([cell isKindOfClass:[ProjectItemCell class]]) {
        ProjectItemCell *itemCell = (ProjectItemCell *)cell;
        
        // API goes here. The followings are hard coded by me
        itemCell.thumbnailImage.image = [UIImage imageNamed:@"person.png"];
        itemCell.projectTitle.text = [@"name " stringByAppendingString:[NSString stringWithFormat: @"%ld", (long)(indexPath.row + 1)]];
        if (indexPath.row % 3 == 0) {
            itemCell.projectIntro.text = @"I am an Overriden developer";
        } else if (indexPath.row % 3 == 1) {
            itemCell.projectIntro.text = @"I am an Overriden developer";
        } else {
            itemCell.projectIntro.text = @"I am a Overriden developer";
        }
        
        //itemCell.projectTitle.text = @"Name";
        //itemCell.projectIntro.text = @"A brief introduction to a user";
    }
    
    // Configure the cell...
    
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
