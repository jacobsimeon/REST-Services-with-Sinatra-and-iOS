//
//  LBDeleteObjectService.m
//  CheckInToWin
//
//  Created by Jacob Morris on 1/12/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBDeleteObjectService.h"
#import "LBDataManager.h"
@implementation LBDeleteObjectService

@synthesize delegate;
@synthesize target;

+(LBDeleteObjectService *)serviceWithDelegate: (id<LBDeleteObjectDelegate>)delegate{
  LBDeleteObjectService *newService = [[LBDeleteObjectService alloc] init];
  newService.delegate = delegate;
  return newService;
}

-(void)deleteObject:(NSObject *)_target{
  self.target = _target;
  [[[LBDataManager sharedManager] rkObjectManager]
   deleteObject:target
   delegate:self];
}


-(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response{
  [self.delegate didDeleteObject:self.target];
  [super request:request didLoadResponse:response];
}

@end
