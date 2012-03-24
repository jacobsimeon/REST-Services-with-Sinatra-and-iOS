//
//  TaskDetails.m
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "TaskFormView.h"


@interface TaskFormView(Private)
-(void)saveTask;
-(void)updateTask;
@end
@implementation TaskFormView
@synthesize delegate, task;

-(void)updateView{
  taskDescriptionView.text = self.task.description;
  taskPriority.text = self.task.priority.stringValue;
  priorityStepper.value = self.task.priority.doubleValue;
  taskTitleView.text = self.task.name;
}

-(void)save:(id)sender{
  self.task.description = taskDescriptionView.text;
  self.task.name = taskTitleView.text;
  self.task.priority = [NSNumber numberWithDouble:priorityStepper.value];
  if(self.task.taskId != nil){
    [self updateTask];
  }else{
    [self saveTask];
  }
}

#pragma - Update Task
-(void)updateTask{
  [[LBUpdateObjectService serviceWithDelegate:self] 
   updateObject:self.task
   withMapping:[Task serializationMapping]];
}
-(void)didUpdateObject:(NSObject *)target{
  [self.delegate taskFormView:self didSaveTask:self.task];
}
-(void)objectdidFailUpdate:(NSObject *)target{ }

#pragma - Save Task
-(void)saveTask{
  [[LBCreateObjectService serviceWithDelegate:self] 
   createObject:self.task 
   withMapping:[Task serializationMapping]];
}

-(void)didCreateObject:(NSObject *)theObject{
  [self.delegate taskFormView:self didSaveTask:self.task];
}

-(void)objectDidFailCreation:(NSError *)error{
  [[[UIAlertView alloc] initWithTitle:@"Error" 
                              message:error.localizedDescription 
                             delegate:self 
                    cancelButtonTitle:@"Ok" 
                    otherButtonTitles: nil] show];
}


-(void)cancel:(id)sender{
  [self.delegate taskFormViewDidCancel:self];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  UITouch *touch = [[event allTouches] anyObject];
  if(taskDescriptionView.isFirstResponder && touch.view != taskDescriptionView){
    [taskDescriptionView resignFirstResponder];
  }
  if(taskTitleView.isFirstResponder && touch.view != taskTitleView){
    [taskTitleView resignFirstResponder];
  }
}

-(void)stepPriority:(id)sender{
  NSLog(@"%@", sender);
  NSNumber *val = [NSNumber numberWithDouble:priorityStepper.value];
  [taskPriority setText:val.stringValue];
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
