//
//  AddProjectViewController.m
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "AddProjectViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation AddProjectViewController

@synthesize project, delegate;

-(void)saveProject{
  [[LBCreateObjectService serviceWithDelegate:self]
   createObject:self.project withMapping:[Project mapping]];
}

-(void)didCreateObject:(NSObject *)theObject{
  [self.delegate addProjectViewDidSaveProject:self.project];
}

-(void)objectDidFailCreation:(NSError *)error{
  
  [[UIAlertView alloc] initWithTitle:@"Error" 
                             message:error.localizedDescription 
                            delegate:nil 
                   cancelButtonTitle:@"Ok" 
                   otherButtonTitles:nil];
}

#pragma mark - View lifecycle
-(IBAction)cancel:(id)sender{
  [self.delegate addProjectViewDidCancel];
}

-(IBAction)submit:(id)sender{
  self.project.name = projectNameTextField.text;
  [self saveProject];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];   
}

- (void)viewDidLoad
{
  [super viewDidLoad];
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
