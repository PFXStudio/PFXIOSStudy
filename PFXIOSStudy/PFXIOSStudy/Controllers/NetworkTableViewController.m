//
//  NetworkTableViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NetworkTableViewController.h"
#import "AppListParser.h"

@interface NetworkTableViewController () <NSURLConnectionDelegate>

@property (strong, nonatomic) NSArray *appDatas;

@end

@implementation NetworkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appDatas = [NSArray array];
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/kr/rss/newfreeapplications/limit=100/genre=6014/xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil)
        {
            return;
        }
        
        [[AppListParser new] parseWithData:data completion:^(NSArray *appDatas, NSError *error) {
            if (error != nil)
            {
                return;
            }
            
            self.appDatas = appDatas;
            [self.tableView reloadData];
        }];
        
    }] resume];
    
//
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.appDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    AppData *appData = [self.appDatas objectAtIndex:indexPath.row];
    [cell.textLabel setText:appData.title];
    [cell.detailTextLabel setText:appData.artist];
    [cell.imageView setAlpha:0];
    NSString *imageKey = [appData imageKeyWithIndex:0];
    UIImage *image = [[ImagePerform sharedImagePerform] loadWithName:imageKey];
    if (image != nil)
    {
        [cell.imageView setImage:image];
        [cell.imageView setAlpha:1];
        return cell;
    }
    
    __weak typeof(UITableViewCell *) weakCell = cell;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[appData.imagePaths firstObject]]];
    [weakCell.imageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"iconAlert"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (image == nil)
        {
            return;
        }
        
        [[ImagePerform sharedImagePerform] saveWithName:imageKey image:image];
        [weakCell.imageView setImage:image];
        [UIView animateWithDuration:0.5 animations:^{
            [weakCell.imageView setAlpha:1];
        }];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"error %@", error);
    }];
    // Configure the cell...
    
    return cell;
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
