//
//  CodeMenuViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 23..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "CodeMenuViewController.h"
#import "CodeViewController.h"

@interface CodeMenuViewController ()

@property (strong, nonatomic) NSString *path;
@property (weak, nonatomic) id sender;

@end

@implementation CodeMenuViewController

- (void)initWithSender:(id)sender parentView:(UIView *)parentView path:(NSString *)path
{
    self.sender = sender;
    self.path = [kRootDomain stringByAppendingPathComponent:path];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [parentView addSubview:self.view];
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:parentView
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:parentView
                                                                   attribute:NSLayoutAttributeTrailing
                                                                  multiplier:1.0
                                                                    constant:0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:parentView
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:0]];
    
    [parentView addConstraint:[NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:parentView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:0]];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)touchedCodeViewButton:(id)sender {
    if ([self.sender isKindOfClass:[UINavigationController class]] == YES)
    {
        UINavigationController *navigationController = (UINavigationController *)self.sender;
        CodeViewController *codeViewController = [[StoryboardPerform sharedWebStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([CodeViewController class])];
        codeViewController.path = self.path;
        codeViewController.navigationController.navigationItem.leftBarButtonItem = nil;
        [navigationController pushViewController:codeViewController animated:YES];
        return;
    }

    if ([self.sender isKindOfClass:[UIViewController class]] == YES)
    {
        UINavigationController *navigationController = [[StoryboardPerform sharedWebStoryBoard] instantiateViewControllerWithIdentifier:@"CodeNavigationController"];
        [sender presentViewController:navigationController animated:YES completion:nil];
        return;
    }
}

@end
