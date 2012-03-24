//
//  AddProjectViewController.h
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Project.h"
#import "LBCreateObjectService.h"

@protocol AddProjectDelegate
-(void)addProjectViewDidCancel;
-(void)addProjectViewDidSaveProject:(Project *)project;
@end

@interface AddProjectViewController : UIViewController<
  LBObjectCreationDelegate
>{
  IBOutlet UITextField *projectNameTextField;
}

@property (nonatomic, retain) Project *project;
@property (nonatomic, retain) id<AddProjectDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)submit:(id)sender;
@end
