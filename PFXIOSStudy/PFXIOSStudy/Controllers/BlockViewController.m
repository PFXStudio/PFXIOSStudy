//
//  BlockViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

/*
 블럭(Block)코드는 C 함수이다. 
 정확히 표현하자면 런타임에 생성되는 다이나믹 함수(Dynamic Function)이다. 
 여기서 런타임(Runtime)과 다이나믹(Dynamic) 이란 의미에 중점을 두면 '병렬처리'나 '비동기처리(Asyncronous Processing)', 혹은 '함수형언어(Functional Language)'의 특징과 비슷하다.
 함수포인터로 생각하면 이해하기 쉬울 것이다
*/
@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/BlockViewController.m"];
    [self addChildViewController:codeMenuViewController];
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
- (IBAction)touchedMainQueueRequestButton:(id)sender {
    [self mainQueueRequestWithCompletion:^(NSString *appStoreVersion, NSError *error) {
        if (error != nil)
        {
            NSLog(@"%@", error);
            return;
        }
        
        NSLog(@"mainQueueRequestWithCompletion %@\n", appStoreVersion);
    }];
}

- (IBAction)touchedGlobalQueueRequestButton:(id)sender {
    [self backgroundRequestWithCompletion:^(NSString *appStoreVersion, NSError *error) {
        if (error != nil)
        {
            NSLog(@"%@", error);
            return;
        }
        
        NSLog(@"backgroundRequestWithCompletion %@\n", appStoreVersion);
    }];
}

- (IBAction)touchedCheckLockButton:(id)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)requestWithCompletion:(void(^)(NSString *appStoreVersion, NSError *error))completion
{
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/lookup?bundleId=com.pfxstudio.HoneyRoom"]];
    NSData* data = [NSData dataWithContentsOfURL:url];
    NSDictionary* lookup = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if ([lookup[@"resultCount"] integerValue] == 1)
    {
        if (completion == nil)
        {
            return;
        }
        
        NSString* appStoreVersion = lookup[@"results"][0][@"version"];
        completion(appStoreVersion, nil);
        return;
    }
    
    if (completion == nil)
    {
        return;
    }
    
    NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__] code:ErrorType_AppStoreVersion userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"ErrorType_AppStoreVersion", @"errorType", nil]];
    completion(nil, error);
}

- (void)mainQueueRequestWithCompletion:(void(^)(NSString *appStoreVersion, NSError *error))completion
{
    // 시리일 디스패치 큐
    // 메인 쓰레드에서 실행된다
    dispatch_async(dispatch_get_main_queue(), ^{
        for (int i = 0; i < 10000; i++)
        {
            NSLog(@"mainQueue %d", i);
        }

        [self requestWithCompletion:completion];
    });
}

- (void)backgroundRequestWithCompletion:(void(^)(NSString *appStoreVersion, NSError *error))completion
{
    // 콘커런트 디스패치 큐
    // 별도의 쓰레드에서 실행된다
    // 메인 쓰레드가 아니기 때문에 작업이 끝난 후 화면 제어를 하게 될 경우 메인 쓰레드로 호출 해 줘야 한다(performSelectorOnMainThread)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 10000; i++)
        {
            NSLog(@"backgroundQueue %d", i);
        }

        [self requestWithCompletion:completion];
    });
}

@end
