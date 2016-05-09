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
        NSString* appStoreVersion = lookup[@"results"][0][@"version"];
        
        if (completion == nil)
        {
            return;
        }
        
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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 10000; i++)
        {
            NSLog(@"backgroundQueue %d", i);
        }

        [self requestWithCompletion:completion];
    });
}

@end
