//
//  LBReadObjectService.m
//  CheckInToWin
//
//  Created by Jacob Morris on 1/6/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBReadObjectService.h"
#import "LBDataManager.h"

@implementation LBReadObjectService
@synthesize delegate;

+(LBReadObjectService *)serviceWithDelegate:(NSObject<LBReadObjectsDelegate> *)theDelegate{
  LBReadObjectService *newService = [[LBReadObjectService alloc]init];
  newService.delegate = theDelegate;
  return newService;
}

-(void)readObjectsForMapping:(RKObjectMapping *)mapping 
                      atPath:(NSString *)resourcePath{
  
  [[[LBDataManager sharedManager] rkObjectManager]
    loadObjectsAtResourcePath:resourcePath
    objectMapping:mapping delegate:self];

}

-(void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)_objects{
  [delegate readObjectService:self didReadObjects:_objects];
  [super objectLoader:objectLoader didLoadObjects:_objects];
}

-(void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error{
  [delegate readObjectService:self didFailReadWithError:error];
  [super objectLoader:objectLoader didFailWithError:error];
}

@end
