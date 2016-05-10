//
//  NetworkTableViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "NetworkTableViewController.h"
#import "AppListParser.h"

@interface NetworkTableViewController () <NSURLConnectionDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) NSArray *appDatas;

@end

/*
 네트워크 연동 테스트
 NSURLConnection 객체를 활용하여 네트워크 연동을 하였었는데 
 iOS7 부터 NSURLSession 객체가 추가 되었다
 업로드, 다운로드를 백그라운드로 할 수 있다고 보았는데 영어 실력 부족으로 조금 더 알아보고 보완하겠다
 이 예제는 앱 목록을 애플 스토어에서 받아와 화면에 보여주는 예제이다
 
 AFNetworking 오픈소스는 네트워크 연동을 보다 쉽게 구현 해 놓은 오픈소스이다
 이 오픈소스를 한번 사용한 이후부터 이 오픈소스만 사용하게 되었다 매우 잘된다
 이 예제는 앱 아이콘 이미지를 서버로부터 받아와 화면에 보여주는 예제이다
*/
@implementation NetworkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appDatas = [NSArray array];
    
    NSString *urlPath = @"https://itunes.apple.com/kr/rss/newfreeapplications/limit=100/genre=6014/xml?한글=이쁘다";
    // 네트워크 통신 시 인코딩을 해줘야 정상적으로 동작한다. 위 경로의 한글=이쁘다는 인코딩 테스트를 하기 위해 작성 하였음
    NSURL *url = [[NSURL alloc] initWithDataRepresentation:[urlPath dataUsingEncoding:NSUTF8StringEncoding] relativeToURL:nil];
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
            [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
        }];
        
    }] resume];
    
//
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/NetworkTableViewController.m"];
    [self addChildViewController:codeMenuViewController];
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
