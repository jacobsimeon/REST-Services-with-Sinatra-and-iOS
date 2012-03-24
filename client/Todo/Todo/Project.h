//
//  Project.h
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Project : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSMutableArray *tasks;
@property (nonatomic, retain) NSNumber *projectId;

+(RKObjectMapping *)mapping;
+(RKObjectMapping *)serializationMapping;

@end
