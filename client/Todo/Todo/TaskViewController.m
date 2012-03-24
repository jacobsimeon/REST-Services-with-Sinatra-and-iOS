//
//  TaskViewController.m
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "TaskViewController.h"
#import "TaskFormView.h"
#import "TaskDetailsView.h"
#import "Task.h"

@implementation TaskViewController
@synthesize tasks;

-(void)loadData{
  [[LBReadObjectService serviceWithDelegate:self] readObjectsForMapping:[Task mapping] atPath:@"tasks"];
}

-(void)readObjectService:(LBReadObjectService *)service didReadObjects:(NSArray *)objects{
  self.tasks = objects; 
  [self.tableView reloadData];
}

-(void)readObjectService:(LBReadObjectService *)service didFailReadWithError:(NSError *)error{
  [[[UIAlertView alloc] initWithTitle:@"Error" 
                             message:error.localizedDescription 
                            delegate:self 
                   cancelButtonTitle:@"Ok" 
                    otherButtonTitles: nil] show];
}

-(void)addTaskClick:(id)sender{
  TaskFormView *taskForm = [[TaskFormView alloc]initWithNibName:@"TaskFormView" bundle:nil];
  Task *newTask = [[Task alloc]init];
  taskForm.task = newTask;
  taskForm.delegate = self;
  [self.navigationController presentModalViewController:taskForm animated:YES];
}

-(void)taskFormViewDidCancel:(TaskFormView *)taskFormView{
  [self.navigationController dismissModalViewControllerAnimated:YES];  
}

-(void)taskFormView:(TaskFormView *)taskFOrmView didSaveTask:(NSObject *)task{
  [self.navigationController dismissModalViewControllerAnimated:YES];
  [self loadData];
}


- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  Task *task = [self.tasks objectAtIndex:indexPath.row];
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:task.taskId.stringValue];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:task.taskId.stringValue];
  }
  cell.textLabel.text = task.name;
  cell.textLabel.textColor = task.isComplete ? [UIColor greenColor] : [UIColor redColor];
  return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  TaskDetailsView *details = [[TaskDetailsView alloc]initWithNibName:@"TaskDetailsView" bundle:nil];
  details.task = [self.tasks objectAtIndex:indexPath.row];
  [self.navigationController pushViewController:details animated:YES]; 
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self loadData];  
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  [self loadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
