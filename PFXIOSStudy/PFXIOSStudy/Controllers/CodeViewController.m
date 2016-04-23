//
//  CodeViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 23..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.path]];
    [self.webView loadRequest:request];
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

@end
