//
//  TaskDetails.h
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBCreateObjectService.h"
#import "LBUpdateObjectService.h"
#import "Task.h"

@class TaskFormView;

@protocol TaskFormViewDelegate <NSObject>
-(void)taskFormViewDidCancel:(TaskFormView *)taskFormView;
-(void)taskFormView:(TaskFormView *)taskFOrmView didSaveTask:(Task *)task;
@end

@interface TaskFormView : UIViewController<
  UITextFieldDelegate, 
  UITextViewDelegate,
  LBObjectCreationDelegate,
  LBUpdateObjectDelegate
>{
  IBOutlet UITextField *taskTitleView;
  IBOutlet UITextView *taskDescriptionView;
  IBOutlet UITextField *taskPriority;
  IBOutlet UIStepper *priorityStepper;
}

-(IBAction)stepPriority:(id)sender;
-(IBAction)save:(id)sender;
-(IBAction)cancel:(id)sender;

@property (nonatomic, assign) IBOutlet id<TaskFormViewDelegate> delegate;
@property (nonatomic, assign) Task *task;


@end
