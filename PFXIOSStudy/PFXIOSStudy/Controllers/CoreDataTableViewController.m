//
//  CoreDataTableViewController.m
//  PFXIOSStudy
//
//  Created by succorer on 2016. 4. 22..
//  Copyright © 2016년 PFXStudio. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "AppDelegate.h"
#import "CodeViewController.h"
#import "CodeMenuViewController.h"

@interface CoreDataTableViewController () <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSString *entityName;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

/*
 CoreData를 활용한 예제 코드
 CoreData는 로컬 데이터베이스를 쉽게 구성해 주는 도구로 생각하면 된다
 이 예제는 CoreData 삽입, 삭제, 목록을 다루는 코드이며 NSFetchedResultsController 사용 예제도 포함되어 있다
 
*/
@implementation CoreDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initialize];

    CodeMenuViewController *codeMenuViewController = [[CodeMenuViewController alloc] initWithNibName:NSStringFromClass([CodeMenuViewController class]) bundle:[NSBundle mainBundle]];
    [codeMenuViewController initWithSender:self.navigationController parentView:self.containerView path:@"Controllers/CoreDataTableViewController.m"];
    [self addChildViewController:codeMenuViewController];
}

- (void)initialize
{
    self.entityName = @"TestEntity";
    [self.fetchedResultsController setDelegate:nil];
    self.fetchedResultsController = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CoreDataTableSectionType_Max;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == CoreDataTableSectionType_Add)
    {
        return 1;
    }
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][CoreDataTableSectionType_Data];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coreDataCell" forIndexPath:indexPath];
    if (indexPath.section == CoreDataTableSectionType_Add)
    {
        [cell.textLabel setText:@"Add"];
        return cell;
    }
    
    NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSNumber *value = [object valueForKey:@"value"];
    [cell.textLabel setText:[value stringValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section != CoreDataTableSectionType_Add)
    {
        return;
    }
    
    NSInteger count = [[NSDate date] timeIntervalSince1970];
    NSNumber *value = [NSNumber numberWithInteger:count];
    
    // CoreData 삽입 코드
    NSManagedObjectContext *context = [[CoreDataManager sharedCoreDataManager] testEntityContext];
    NSManagedObject *entityObject = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:context];
    [entityObject setValue:value forKey:@"value"];
    [entityObject setValue:[NSDate date] forKey:@"inputTime"];
    
    NSError *error = nil;
    [context save:& error];
    NSLog(@"%s\nerror : %@", __PRETTY_FUNCTION__, error);
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == CoreDataTableSectionType_Add)
    {
        return NO;
    }
    
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        // CoreData 삭제 코드
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    // CoreData 목록 코드
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSManagedObjectContext *context = [[CoreDataManager sharedCoreDataManager] testEntityContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:self.entityName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"inputTime" ascending:NO];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
        {
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
            break;
        case NSFetchedResultsChangeMove:
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
        {
        }
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)touchedEditButton:(id)sender {
    [self.tableView setEditing:! [self.tableView isEditing] animated:YES];
}

@end
