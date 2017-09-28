//
//  CodeTipViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "CodeTipViewController.h"

@interface CodeTipViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CodeTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/CodeTipViewController.m"];
    [self addChildViewController:codeMenuViewController];
    
    [self absoluteTimeTip];
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

- (void)absoluteTimeTip {
    NSLog(@"========== AbsoluteTime Tip ========== ");
    CFAbsoluteTime startTime = CFAbsoluteTimeGetCurrent();
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        for (int i = 0; i < 5000; i++) {
            NSLog(@"counting %d", i);
        }
        
        NSUInteger milliseconds = (NSUInteger)((CFAbsoluteTimeGetCurrent() - startTime) * 1000);
        NSLog(@"absoluteTime Tip in %lu ms", milliseconds);
        
        NSLog(@"========== AbsoluteTime Tip END ========== ");
    });
}

@end
