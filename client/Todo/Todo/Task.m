//
//  Task.m
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize name, description, priority, isComplete, taskId;

+(RKObjectMapping *)mapping{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
  [mapping mapAttributes:@"name", @"description", @"priority", nil];
  [mapping mapKeyPath:@"is_complete" toAttribute:@"isComplete"];
  [mapping mapKeyPath:@"id" toAttribute:@"taskId"];  
  return mapping;
}

+(RKObjectMapping *)serializationMapping{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
  [mapping mapKeyPath:@"name" toAttribute:@"name"];
  [mapping mapKeyPath:@"priority" toAttribute:@"priority"];
  [mapping mapKeyPath:@"description" toAttribute:@"description"];
  [mapping mapKeyPath:@"isComplete" toAttribute:@"is_complete"];
  return mapping;
}

@end
