//
//  ContainerViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "ContainerViewController.h"
#import "SwapViewController.h"
#import "CodeMenuViewController.h"

@interface ContainerViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) SwapViewController *swapViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/SwapViewController.m"];
    [self addChildViewController:codeMenuViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.swapViewController = segue.destinationViewController;
    }
}

- (IBAction)valueChanged:(id)sender {
    [self.segmentedControl setUserInteractionEnabled:NO];
    [self.swapViewController swapViewControllersWithCompletion:^{
        [self.segmentedControl setUserInteractionEnabled:YES];
    }];
}


@end
