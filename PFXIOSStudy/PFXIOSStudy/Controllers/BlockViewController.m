//
//  BlockViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *requestButton;

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

- (IBAction)touchedRequestButton:(id)sender {
    [self.requestButton setEnabled:NO];
    [self.textView setText:@""];
    
    __weak typeof(self) weakSelf = self;
    [self requestWithCompletion:^(NSString *appStoreVersion, NSError *error) {
        [weakSelf.requestButton setEnabled:YES];
        if (error != nil)
        {
            NSLog(@"%@", error);
            return;
        }
        
        [weakSelf.textView setText:appStoreVersion];
        NSLog(@"AppStoreVersion %@", appStoreVersion);
    }];
}

- (void)requestWithCompletion:(void(^)(NSString *appStoreVersion, NSError *error))completion
{
    dispatch_async(dispatch_get_main_queue(), ^{
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
        }
    });
}


@end
