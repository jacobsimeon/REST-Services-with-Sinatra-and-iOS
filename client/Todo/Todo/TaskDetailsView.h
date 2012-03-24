//
//  TaskDetailsView.h
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskFormView.h"
#import "Task.h"
#import "LBDeleteObjectService.h"
#import "LBUpdateObjectService.h"

@interface TaskDetailsView : UIViewController<
  UIActionSheetDelegate,
  TaskFormViewDelegate,
  LBDeleteObjectDelegate,
  LBUpdateObjectDelegate
>{
  IBOutlet UIBarButtonItem *actionButtonItem;
  IBOutlet UILabel *titleView;
  IBOutlet UILabel *descriptionView;
  IBOutlet UILabel *priorityView;
}
@property (nonatomic, retain) Task *task;


-(IBAction)actionButtonClick:(id)sender;

@end
