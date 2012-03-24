//
//  LBUpdateObjectService.m
//  CheckInToWin
//
//  Created by Jacob Morris on 1/6/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <RestKit/RKErrorMessage.h>
#import "LBUpdateObjectService.h"
#import "LBDataManager.h"

@implementation LBUpdateObjectService
@synthesize delegate;
@synthesize target;

+(LBUpdateObjectService *)serviceWithDelegate:(NSObject<LBUpdateObjectDelegate> *)theDelegate{
  LBUpdateObjectService *newService = [[LBUpdateObjectService alloc]init];
  newService.delegate = theDelegate;
  return newService;
}

-(void)updateObject:(NSObject *)theObject withMapping:(RKObjectMapping *)mapping{
  self.target = theObject;
  [[LBDataManager sharedManager].rkObjectManager
   putObject:theObject mapResponseWith:mapping delegate:self];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
  [self.delegate objectdidFailUpdate:self.target];
  [super objectLoader:objectLoader didFailWithError:error];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)_objects{
  [self.delegate didUpdateObject:self.target];
  [super objectLoader:objectLoader didLoadObjects:_objects];
}

@end
