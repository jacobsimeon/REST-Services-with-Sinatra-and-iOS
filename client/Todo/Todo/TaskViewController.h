//
//  TaskViewController.h
//  Todo
//
//  Created by Jacob Morris on 3/22/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskFormView.h"
#import "LBReadObjectService.h"

@interface TaskViewController : UITableViewController<
  TaskFormViewDelegate,
  LBReadObjectsDelegate>{
  IBOutlet UIBarButtonItem *actionButtonItem;
}
@property (nonatomic, retain) NSArray *tasks;

-(IBAction)addTaskClick:(id)sender;

@end
