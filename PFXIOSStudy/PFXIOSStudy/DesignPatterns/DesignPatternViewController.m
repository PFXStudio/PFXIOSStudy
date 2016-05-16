//
//  DesignPatternViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 27..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "DesignPatternViewController.h"

@interface DesignPatternViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *classContainerView;

@end

/*
 디자인패턴 예제 코드이다
 디자인패턴 실제 코드는 DesignPatternTests.m 파일을 확인하기 바란다
*/
@implementation DesignPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"../DesignPatternTests/DesignPatternTests.m"];
    [self addChildViewController:codeMenuViewController];
    
    CodeMenuViewController *codeMenuViewController1 = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController1 initWithSender:self.navigationController parentView:self.classContainerView path:@"DesignPatterns/"];
    [self addChildViewController:codeMenuViewController1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

@end
