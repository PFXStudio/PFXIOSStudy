//
//  SwapViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "SwapViewController.h"

@interface SwapViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) UIViewController *firstViewController;
@property (strong, nonatomic) UIViewController *secondViewController;
@property (strong, nonatomic) void(^completionBlock)(void);

@end

@implementation SwapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentSegueIdentifier = kFirstIdentifier;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
#error TODO : Swap
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initialize
{
    if ([self.currentSegueIdentifier isEqualToString:kFirstIdentifier])
    {
        [self.firstViewController removeFromParentViewController];
        return;
    }
    
    if ([self.currentSegueIdentifier isEqualToString:kSecondIdentifier])
    {
        [self.secondViewController removeFromParentViewController];
        return;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kFirstIdentifier]) {
        self.firstViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:kSecondIdentifier]) {
        self.secondViewController = segue.destinationViewController;
    }
    
    if ([segue.identifier isEqualToString:kFirstIdentifier])
    {
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:kSecondIdentifier])
    {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        [fromViewController.view removeFromSuperview];
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        
        if (self.completionBlock == nil)
        {
            return;
        }
        
        self.completionBlock();
    }];
}

- (void)swapViewControllersWithCompletion:(void(^)(void))completion
{
    self.completionBlock = completion;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier  isEqual: kFirstIdentifier]) ? kSecondIdentifier : kFirstIdentifier;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}


@end
