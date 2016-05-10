//
//  SerializeTableViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 5. 3..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "SerializeTableViewController.h"

@interface SerializeTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) NSMutableArray *appDatas;

@end

/* Serialize
 임의의 객체를 데이터로 변경하는 것을 serialize(직렬화)라고 부른다
 iOS에서는 NSKeyedArchiver, NSUnkeyedArchiver 객체를 이용하여 serialize를 한다
*/
@implementation SerializeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/SerializeTableViewController.m"];
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppData *appData = [self.appDatas objectAtIndex:indexPath.row];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appData.link]];
}

- (IBAction)touchedSerializeButton:(id)sender {
    NSMutableArray *appDatas = [NSMutableArray array];
    
    AppData *
    appData = [AppData appDataWithUniqueKey:@"1088152133"
                                      title:@"꿀방 - 오피스텔,원룸,투룸,아파트! 방 평가 꿀정보 앱"
                                     artist:@"PFXStudio"
                                       link:@"itms-apps://itunes.apple.com/kr/app/kkulbang-opiseutel-wonlum/id1088152133?mt=8"
                                 imagePaths:[NSArray arrayWithObjects:@"http://a5.mzstatic.com/us/r30/Purple4/v4/b4/c2/1b/b4c21bfd-04fe-a0ef-34fe-5ac4334c628f/screen322x572.jpeg", @"http://a5.mzstatic.com/us/r30/Purple1/v4/83/0e/25/830e256c-9aa6-38f7-9d63-de1970537cc0/screen322x572.jpeg", @"http://a2.mzstatic.com/us/r30/Purple49/v4/6d/5a/c5/6d5ac598-7005-9690-1496-eba61357b32e/screen322x572.jpeg", nil]];
    [appDatas addObject:appData];
    
    appData = [AppData appDataWithUniqueKey:@"1059008698"
                                      title:@"EightKnights"
                                     artist:@"PFXStudio"
                                       link:@"itms-apps://itunes.apple.com/kr/app/eightknights/id1059008698?l=en&mt=8"
                                 imagePaths:[NSArray arrayWithObjects:@"http://a2.mzstatic.com/us/r30/Purple69/v4/f3/8b/12/f38b12fa-e5fa-ba46-e848-6c76169074ab/screen322x572.jpeg", @"http://a2.mzstatic.com/us/r30/Purple5/v4/c1/a1/e0/c1a1e0e5-fcba-725f-92e1-a34e6e4513e3/screen322x572.jpeg", @"http://a5.mzstatic.com/us/r30/Purple5/v4/a6/7d/8d/a67d8da4-e3c1-a50b-8529-eab8a2499940/screen322x572.jpeg", nil]];
    [appDatas addObject:appData];
    
    appData = [AppData appDataWithUniqueKey:@"1084164405"
                                      title:@"심쿵이 - 온 세상이 심쿵심쿵! 감동 메시지 알림 어플"
                                     artist:@"PFXStudio"
                                       link:@"itms-apps://itunes.apple.com/kr/app/simkung-i-on-sesang-i-simkungsimkung!/id1084164405?mt=8"
                                 imagePaths:[NSArray arrayWithObjects:@"http://a4.mzstatic.com/us/r30/Purple69/v4/18/0c/e7/180ce75e-01ad-1675-4aac-09c7517af61d/screen322x572.jpeg", @"http://a2.mzstatic.com/us/r30/Purple49/v4/e7/42/0e/e7420e4c-43c1-a2da-13d3-1a50fd6a74a3/screen322x572.jpeg", @"http://a3.mzstatic.com/us/r30/Purple49/v4/36/d9/c3/36d9c33e-6787-478e-9985-a821eb87d510/screen322x572.jpeg", nil]];
    [appDatas addObject:appData];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"serialize.txt"];
    
    // AppData 객체에 NSCoding 프로토콜이 구현 되어 있어야 함(AppData 클래스 파일 참조)
    // 배열에 저장 된 객체 정보를 데이터화 하여 파일로 저장
    [NSKeyedArchiver archiveRootObject:appDatas toFile:filePath];

    // 파일로 부터 데이터를 읽어와 배열에 객체화 하여 저장
    self.appDatas = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"filePath: %@ appDatas : %@", filePath, self.appDatas);
    [self.tableView reloadData];
}

@end
