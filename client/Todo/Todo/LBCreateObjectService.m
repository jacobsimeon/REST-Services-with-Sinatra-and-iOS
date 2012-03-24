//
//  CreateObjectService.m
//  CheckInToWin
//
//  Created by Jacob Morris on 1/4/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <RestKit/RKErrorMessage.h>
#import "LBCreateObjectService.h"

@implementation LBCreateObjectService

@synthesize delegate;
@synthesize target;

+(LBCreateObjectService *)serviceWithDelegate:(NSObject<LBObjectCreationDelegate> *)delegate{
  LBCreateObjectService *newService = [[LBCreateObjectService alloc]init];
  newService.delegate = delegate;
  return newService;
}

-(void)createObject:(NSObject *)theObject withMapping:(RKObjectMapping *)mapping{
  self.target = theObject;
  [[LBDataManager sharedManager].rkObjectManager 
   postObject:theObject mapResponseWith:mapping delegate:self];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
  [self.delegate objectDidFailCreation:error];
  [super objectLoader:objectLoader didFailWithError:error];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)loadedObjects{
  [self.delegate didCreateObject:[loadedObjects objectAtIndex:0]];
  [super objectLoader:objectLoader didLoadObjects:loadedObjects];
}

@end
