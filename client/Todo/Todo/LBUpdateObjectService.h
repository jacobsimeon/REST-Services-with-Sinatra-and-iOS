//
//  LBUpdateObjectService.h
//  CheckInToWin
//
//  Created by Jacob Morris on 1/6/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBRestfulService.h"

@protocol LBUpdateObjectDelegate
-(void) didUpdateObject:(NSObject *) target;
-(void) objectdidFailUpdate:(NSObject *) target;
@end

@interface LBUpdateObjectService : LBRestfulService;

@property (nonatomic, retain) id<LBUpdateObjectDelegate> delegate;
@property (nonatomic, retain) NSObject *target;

+(LBUpdateObjectService *) serviceWithDelegate:(NSObject<LBUpdateObjectDelegate> *) theDelegate;
-(void) updateObject:(id)theObject withMapping:(RKObjectMapping *)mapping;

@end
