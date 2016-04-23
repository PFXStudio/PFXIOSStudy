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

- (void)initWithSender:(id)sender path:(NSString *)path
{
    self.sender = sender;
    self.path = [kRootDomain stringByAppendingPathComponent:path];
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
    if ([self.sender isKindOfClass:[UIViewController class]] == YES)
    {
        return;
    }
    
    UINavigationController *navigationController = (UINavigationController *)self.sender;
    CodeViewController *codeViewController = [[StoryboardPerform sharedWebStoryBoard] instantiateViewControllerWithIdentifier:NSStringFromClass([CodeViewController class])];
    [navigationController pushViewController:codeViewController animated:YES];
}

@end
