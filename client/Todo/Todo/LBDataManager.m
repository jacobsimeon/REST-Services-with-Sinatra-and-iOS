//
//  CWDataController.m
//  CWCore
//
//  Created by Jacob Morris on 1/2/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBDataManager.h"
#import "Task.h"

NSString* const kCWServerBaseUrl = @"http://localhost:4567";
static LBDataManager* sharedManager;


@interface LBDataManager(Private)
-(void)registerProjectMappings;
@end

@implementation LBDataManager

@synthesize rkObjectManager;

+(void)setup{
  if(sharedManager == nil)
    [self sharedManager];
}

+(LBDataManager *) sharedManager{
  if(sharedManager == nil){
    sharedManager = [self dataManager];
  }
  return sharedManager;
}

+(LBDataManager*) dataManager{
  
  LBDataManager *newDataManager = [[LBDataManager alloc]init];
  [newDataManager setRkObjectManager:[RKObjectManager objectManagerWithBaseURL:kCWServerBaseUrl]];
  newDataManager.rkObjectManager.client.cachePolicy = RKRequestCachePolicyNone;
  
  [RKObjectManager setSharedManager:newDataManager.rkObjectManager];
  newDataManager.rkObjectManager.serializationMIMEType = RKMIMETypeJSON;
  [newDataManager registerProjectMappings];
    
  return newDataManager;
}

-(NSManagedObjectContext *)moc{
  return self.rkObjectManager.objectStore.managedObjectContext;
}

-(void)registerProjectMappings{
  [self.rkObjectManager.router routeClass:[Task class] toResourcePath:@"/tasks"];
  [self.rkObjectManager.router routeClass:[Task class] toResourcePath:@"/tasks/:taskId" forMethod:RKRequestMethodDELETE];
  [self.rkObjectManager.router routeClass:[Task class] toResourcePath:@"/tasks/:taskId" forMethod:RKRequestMethodPUT];  
  [self.rkObjectManager.mappingProvider addObjectMapping:[Task mapping]];
  [self.rkObjectManager.mappingProvider setSerializationMapping:[Task serializationMapping] forClass:[Task class]];
}

@end
