//
//  LBDeleteObjectService.h
//  CheckInToWin
//
//  Created by Jacob Morris on 1/12/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBRestfulService.h"

@protocol LBDeleteObjectDelegate <NSObject>
-(void)didDeleteObject:(NSObject *)target;
-(void)objectDidFailDelete:(NSObject *)target;
@end

@interface LBDeleteObjectService : LBRestfulService;

@property (nonatomic, retain) id<LBDeleteObjectDelegate> delegate;
@property (nonatomic, retain) NSObject *target;

+(LBDeleteObjectService *)serviceWithDelegate:(NSObject<LBDeleteObjectDelegate> *)delegate;
-(void) deleteObject:(NSObject *)target;

@end
