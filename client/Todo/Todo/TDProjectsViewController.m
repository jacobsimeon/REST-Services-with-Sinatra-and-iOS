//
//  TDFirstViewController.m
//  Todo
//
//  Created by Jacob Morris on 3/18/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "TDProjectsViewController.h"
#import "TaskViewController.h"
#import "Project.h"

@implementation TDProjectsViewController
@synthesize projects;

-(void)loadData{
  [[LBReadObjectService serviceWithDelegate:self] 
    readObjectsForMapping:[Project mapping] 
                  atPath:@"projects"];
}

#pragma mark - LBReadObjectDelgate
-(void)readObjectService:(LBReadObjectService *)service 
          didReadObjects:(NSArray *)objects{
  self.projects = objects;
  [self.tableView reloadData];
}

-(void)readObjectService:(LBReadObjectService *)service 
    didFailReadWithError:(NSError *)error{
  
  [[[UIAlertView alloc]initWithTitle:@"Error" 
                            message:error.localizedDescription
                           delegate:nil 
                  cancelButtonTitle:@"Ok" 
                   otherButtonTitles: nil] show];
  
}


#pragma mark - UITableViewDataSource
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.projects.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  Project *targetProject = [self.projects objectAtIndex:indexPath.row];
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
  cell.textLabel.text = targetProject.name;
  return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  TaskViewController *taskView = [[TaskViewController alloc]initWithNibName:@"TaskViewController" bundle:nil];
  [self.navigationController pushViewController:taskView animated:YES];
}
-(void)addProject:(id)sender{
  AddProjectViewController *addProject = [[AddProjectViewController alloc]initWithNibName:@"AddProjectViewController" bundle:nil];
  addProject.delegate = self;
  addProject.project = [[Project alloc]init];
  [self presentModalViewController:addProject animated:YES];
}

-(void)addProjectViewDidSaveProject:(Project *)project{
  [self loadData];
  [self dismissModalViewControllerAnimated:YES];
}

-(void)addProjectViewDidCancel{
  [self dismissModalViewControllerAnimated:YES];  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}
#pragma mark - View lifecycle
- (void)viewDidLoad {  
  [super viewDidLoad]; 
  [self loadData];
}
- (void)viewDidUnload {  [super viewDidUnload]; }
- (void)viewWillAppear:(BOOL)animated {  [super viewWillAppear:animated]; }
- (void)viewDidAppear:(BOOL)animated {  [super viewDidAppear:animated]; }
- (void)viewWillDisappear:(BOOL)animated {	[super viewWillDisappear:animated]; }
- (void)viewDidDisappear:(BOOL)animated {	[super viewDidDisappear:animated]; }


@end
