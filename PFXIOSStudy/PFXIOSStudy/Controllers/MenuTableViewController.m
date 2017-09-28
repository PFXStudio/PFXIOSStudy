//
//  MenuTableViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "MenuTableViewController.h"
#import "CoreDataTableViewController.h"
#import "ContainerViewController.h"
#import "BlockViewController.h"
#import "DispatchViewController.h"
#import "DesignPatternViewController.h"
#import "NetworkTableViewController.h"
#import "SerializeTableViewController.h"
#import "AlgorithmTableViewController.h"
#import "CodeTipViewController.h"

@interface MenuTableViewController ()

@property (strong, nonatomic) NSArray *studies;

@end
/*
 메뉴 선택 화면
*/
@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Study" ofType:@"plist"];
    self.studies = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.studies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
    [cell.textLabel setText:self.studies[indexPath.row]];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == MenuType_CoreData)
    {
        CoreDataTableViewController *coreDataTableViewController = [[StoryboardPerform sharedCoreDataStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([CoreDataTableViewController class])];
        [self.navigationController pushViewController:coreDataTableViewController animated:YES];
        
        return;
    }

    if (indexPath.row == MenuType_ContainerView)
    {
        ContainerViewController *containerViewController = [[StoryboardPerform sharedContainerStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([ContainerViewController class])];
        [self.navigationController pushViewController:containerViewController animated:YES];
        
        return;
    }

    if (indexPath.row == MenuType_Block)
    {
        BlockViewController *blockViewController = [[StoryboardPerform sharedBlockStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([BlockViewController class])];
        [self.navigationController pushViewController:blockViewController animated:YES];
        
        return;
    }
    
    if (indexPath.row == MenuType_Dispatch)
    {
        DispatchViewController *dispatchViewController = [[StoryboardPerform sharedDispatchStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([DispatchViewController class])];
        [self.navigationController pushViewController:dispatchViewController animated:YES];
        
        return;
    }

    if (indexPath.row == MenuType_DesignPattern)
    {
        DesignPatternViewController *designPatternViewController = [[StoryboardPerform sharedDesignPatternStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([DesignPatternViewController class])];
        [self.navigationController pushViewController:designPatternViewController animated:YES];
        
        return;
    }

    if (indexPath.row == MenuType_Network)
    {
        NetworkTableViewController *designPatternViewController = [[StoryboardPerform sharedNetworkStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([NetworkTableViewController class])];
        [self.navigationController pushViewController:designPatternViewController animated:YES];
        
        return;
    }

    if (indexPath.row == MenuType_Serialize)
    {
        SerializeTableViewController *serializeTableViewController = [[StoryboardPerform sharedSerializeStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([SerializeTableViewController class])];
        [self.navigationController pushViewController:serializeTableViewController animated:YES];
        
        return;
    }
    
    if (indexPath.row == MenuType_Algorithm)
    {
        AlgorithmTableViewController *algorithmTableViewController = [[StoryboardPerform sharedAlgorithmStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([AlgorithmTableViewController class])];
        [self.navigationController pushViewController:algorithmTableViewController animated:YES];
        
        return;
    }
    
    if (indexPath.row == MenuType_CodeTip) {
        CodeTipViewController *codeTipViewController = [[StoryboardPerform sharedCodeTipStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([CodeTipViewController class])];
        
        [self.navigationController pushViewController:codeTipViewController animated:YES];
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
