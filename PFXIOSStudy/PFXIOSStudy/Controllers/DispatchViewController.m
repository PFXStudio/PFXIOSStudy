//
//  DispatchViewController.m
//  PFXIOSStudy
//
//  Created by PFXStudio on 2016. 4. 25..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "DispatchViewController.h"

@interface DispatchViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
/*
 GCD(Grand Central Dispatch)
 C언어로 되어 있는 스레드 관리 기술로 iOS4 부터 지원하고 있다. 또한, GCD와 같은 시점에 등장한 블럭 코딩 기반으로 기존에 사용하던 NSThread, NSOperation 보다 쉽게 스레드 응용 기술을 구현할 수 있도록 지원해준다.
 
 Dispatch Queues
 - 시리일 디스패치 큐(Serial Dispatch Queue).
 큐에 추가된 순서 안에서 선입선출(FIFO) 방식으로 작업을 실행한다. 또한, 큐에 있는 작업 하나를 실행시킨 후에 실행이 끝날 때까지 큐에 있는 다른 작업들은 기다리고 있다. 즉, 스레드 하나로 순차 처리를 하고 있다.
 
 - 콘커런트 디스패치 큐(Concurrent Dispatch Queue).
 시리얼 디스패치 큐와는 다르게 실행 중인 작업을 기다리지 않고 큐에 있는 다른 작업들을 동시에 별도의 스레드에 수행시킨다. 동시에 실행되는 작업 수는 시스템 상태에 따라 달라지며, 이것을 판단 및 관리는 XNU 커널이 알아서 해준다.
*/
@implementation DispatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/DispatchViewController.m"];
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
- (IBAction)touchedBarButton:(id)sender {
    // start
    [self runDispatchAsyncBackground];
    [self runDispatchSync];
    [self runDispatchAsync];

    return;
}

- (void)runDispatchSync
{
    [self.firstLabel setText:@""];

    // 새로운 시리얼 디스패치 큐를 생성
    dispatch_queue_t queue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    // 동기로 작업을 수행
    dispatch_sync(queue, ^{
        NSString *totalText = @"";
        NSInteger x = 2;
        for (long i = 1; i < kMaxCount; i++)
        {
            NSString *text = [NSString stringWithFormat:@"[%ldx%ld=%ld]", x, i, x * i];
            NSLog(@"%@", text);
            totalText = [totalText stringByAppendingString:text];
        }
        
        [self.firstLabel setText:totalText];
    });
}

- (void)runDispatchAsync
{
    [self.secondLabel setText:@""];
    // 메인 디스패치 큐는 작업을 수행하기 위해 메인 스레드를 이용하며, 시리얼 디스패치 큐임
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 비동기로 작업을 수행
    dispatch_async(queue, ^{
        NSString *totalText = @"";
        NSInteger x = 3;
        for (long i = 1; i < kMaxCount; i++)
        {
            NSString *text = [NSString stringWithFormat:@"[%ldx%ld=%ld]", x, i, x * i];
            NSLog(@"%@", text);
            totalText = [totalText stringByAppendingString:text];
        }

        [self.secondLabel setText:totalText];
    });
}

- (void)runDispatchAsyncBackground
{
    [self.thirdLabel setText:@""];
    // 글로벌 디스패치 큐는 콘커런트 디스패치 큐로 XNU 커널에 의하여 새로운 스레드에 작업을 수행
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // 비동기로 작업을 수행
    dispatch_async(queue, ^{
        NSString *totalText = @"";
        NSInteger x = 4;
        for (long i = 1; i < kMaxCount; i++)
        {
            NSString *text = [NSString stringWithFormat:@"[%ldx%ld=%ld]", x, i, x * i];
            NSLog(@"%@", text);
            totalText = [totalText stringByAppendingString:text];
        }

        // 메인 쓰레드가 아니기 때문에 메인 쓰레드로 올려 줘야 콘트롤러에 표기 된다
        [self.thirdLabel performSelectorOnMainThread:@selector(setText:) withObject:totalText waitUntilDone:NO];
    });
}


@end
