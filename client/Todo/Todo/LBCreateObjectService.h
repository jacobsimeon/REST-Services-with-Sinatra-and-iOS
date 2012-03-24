//
//  CreateObjectService.h
//  CheckInToWin
//
//  Created by Jacob Morris on 1/4/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBRestfulService.h"
#import "LBDataManager.h"

@protocol LBObjectCreationDelegate
-(void) didCreateObject:(NSObject *)theObject;
-(void) objectDidFailCreation:(NSError *)target;
@end

@interface LBCreateObjectService : LBRestfulService;

@property (nonatomic, assign) NSObject<LBObjectCreationDelegate>* delegate;
@property (nonatomic, assign) NSObject *target;

+(LBCreateObjectService *) serviceWithDelegate:(NSObject<LBObjectCreationDelegate>*)theDelegate;
-(void) createObject:(id)theObject withMapping:(RKObjectMapping *)mapping;

@end
