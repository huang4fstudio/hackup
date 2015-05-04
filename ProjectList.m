//
//  ProjectList.m
//  HackUp
//
//  Created by Zhuotao Liu on 4/9/15.
//  Copyright (c) 2015 Zhuotao Liu. All rights reserved.
//

////// Note that this is actually the person list. Projects will be collection views 

#import "ProjectList.h"
#import "ProjectItemCell.h"
#import "peopleDetailViewController.h"

@interface ProjectList ()

@end

@implementation ProjectList


- (void)setProjects:(NSArray *)projects {
    _projects = projects;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchProjects];
}

- (void)fetchProjects{
    // add apis here
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return [self.projects count];
    return 12;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"projects" forIndexPath:indexPath];
    if ([cell isKindOfClass:[ProjectItemCell class]]) {
        ProjectItemCell *itemCell = (ProjectItemCell *)cell;
        
        // API goes here. The followings are hard coded by me
        itemCell.thumbnailImage.image = [UIImage imageNamed:@"person.png"];
        itemCell.projectTitle.text = [@"name " stringByAppendingString:[NSString stringWithFormat: @"%ld", (long)(indexPath.row + 1)]];
        if (indexPath.row % 3 == 0) {
            itemCell.projectIntro.text = @"I am an IOS developer";
        } else if (indexPath.row % 3 == 1) {
            itemCell.projectIntro.text = @"I am an Android developer";
        } else {
            itemCell.projectIntro.text = @"I am a web developer";
        }
        
        //itemCell.projectTitle.text = @"Name";
        //itemCell.projectIntro.text = @"A brief introduction to a user";
    }
    
    // Configure the cell...
    
    return cell;
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[ProjectItemCell class]]) {
        NSIndexPath *indexpath = [self.tableView indexPathForCell:sender];
        if (indexpath) {
            if ([segue.identifier isEqualToString:@"showPeople"]) {
                if ([segue.destinationViewController isKindOfClass:[peopleDetailViewController class]]) {
                    peopleDetailViewController *peopleDetail = (peopleDetailViewController *)segue.destinationViewController;
                    // API goes here. The followings are hard coded by me
                    peopleDetail.faceImage = [UIImage imageNamed:@"person.png"];
                    peopleDetail.peopleName = @"Zhuotao Liu \n @zhuotaoliu";
                    peopleDetail.peopleInfo = @"I am graduate student in University of Illinois at Urbana Champaign. I have experience on iOS development and Web development. I am looking forward to working with smart people on cool projects";
                }
            }
        }
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
