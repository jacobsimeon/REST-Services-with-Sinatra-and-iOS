//
//  LBReadObjectService.h
//  CheckInToWin
//
//  Created by Jacob Morris on 1/6/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBRestfulService.h"

@class LBReadObjectService;
@protocol LBReadObjectsDelegate
-(void)readObjectService:(LBReadObjectService *)service didReadObjects:(NSArray *)objects;
-(void)readObjectService:(LBReadObjectService *)service didFailReadWithError:(NSError *)error;
@end

@interface LBReadObjectService : LBRestfulService

@property (nonatomic, retain) NSObject<LBReadObjectsDelegate>* delegate;

+(LBReadObjectService *)serviceWithDelegate:(NSObject<LBReadObjectsDelegate>*)delegate;

-(void)readObjectsForMapping:(RKObjectMapping *)mapping
                      atPath:(NSString *)resourcePath;



@end
