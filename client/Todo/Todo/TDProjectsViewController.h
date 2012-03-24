//
//  TDFirstViewController.h
//  Todo
//
//  Created by Jacob Morris on 3/18/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBReadObjectService.h"
#import "AddProjectViewController.h"

@interface TDProjectsViewController : UITableViewController<
  UITableViewDataSource, 
  UITableViewDelegate,
  LBReadObjectsDelegate,
  AddProjectDelegate
>

@property (nonatomic, retain) NSArray *projects;

-(IBAction)addProject:(id)sender;
@end
