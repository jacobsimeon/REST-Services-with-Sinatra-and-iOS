//
//  Task.h
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Task : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSNumber *priority;
@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, retain) NSNumber *taskId;

+(RKObjectMapping *)mapping;
+(RKObjectMapping *)serializationMapping;

@end
