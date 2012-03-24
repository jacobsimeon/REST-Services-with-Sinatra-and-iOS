//
//  TaskDetailsView.m
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "TaskDetailsView.h"

@interface TaskDetailsView(Private)
-(void)deleteTask;
-(void)markComplete;
-(void)edit;
-(void)updateView;
@end

@implementation TaskDetailsView

@synthesize task;

#pragma mark - Delete Task
-(void)deleteTask{
  [[LBDeleteObjectService serviceWithDelegate:self] deleteObject:self.task];
}
-(void)didDeleteObject:(NSObject *)target{
  [self.navigationController popViewControllerAnimated:YES];
}
-(void)objectDidFailDelete:(NSObject *)target{ }


#pragma mark - Mark Task As Complete
-(void)markComplete{
  task.isComplete = !task.isComplete;
  [[LBUpdateObjectService serviceWithDelegate:self] 
   updateObject:self.task
   withMapping:[Task serializationMapping]];
}
-(void)didUpdateObject:(NSObject *)target{
  [self.navigationController popViewControllerAnimated:YES];
}
-(void)objectdidFailUpdate:(NSObject *)target{ }


#pragma mark - Show Edit Form
-(void)edit{
  TaskFormView *taskForm = [[TaskFormView alloc] initWithNibName:@"TaskFormView" bundle:nil];
  taskForm.task = self.task;
  taskForm.delegate = self;
  [self.navigationController presentModalViewController:taskForm animated:YES];
}

-(void)taskFormViewDidCancel:(TaskFormView *)taskFormView{
  [self.navigationController dismissModalViewControllerAnimated:YES];
  [self updateView];
}

-(void)taskFormView:(TaskFormView *)taskFOrmView didSaveTask:(Task *)task{
  [self.navigationController dismissModalViewControllerAnimated:YES];
  [self updateView];  
}





#pragma mark - Other Stuff
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
  NSLog(@"%d", buttonIndex);
  switch (buttonIndex) {
    case 0: //delete
      [self deleteTask];
      break;
    case 1: //edit
      [self edit];
      break;
    case 2: //mark complete
      [self markComplete];
      break;
  }
}

-(void)updateView{
  descriptionView.text = self.task.description;
  titleView.text = self.task.name;
  priorityView.text = self.task.priority.stringValue;
}

-(IBAction)actionButtonClick:(id)sender{
  NSString *completeButtonTitle = self.task.isComplete ? @"Mark Incomplete" : @"Mark Complete";
  
  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Take Action" 
                                                           delegate:self 
                                                  cancelButtonTitle:@"Cancel" 
                                             destructiveButtonTitle:@"Delete"
                                                  otherButtonTitles:@"Edit", completeButtonTitle, nil];
  [actionSheet showInView:self.view];
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



- (void)viewDidLoad
{
  [super viewDidLoad];
  self.navigationItem.rightBarButtonItem = actionButtonItem;
  [self updateView];
  // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
