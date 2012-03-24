//
//  Project.m
//  Todo
//
//  Created by Jacob Morris on 3/23/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "Project.h"

@implementation Project

@synthesize name;
@synthesize tasks;
@synthesize projectId;

+(RKObjectMapping *)mapping{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
  [mapping mapAttributes:@"name", nil];
  [mapping mapKeyPath:@"id" toAttribute:@"projectId"];
  return mapping;
}

+(RKObjectMapping *)serializationMapping{
  RKObjectMapping *mapping = [RKObjectMapping mappingForClass:self];
  [mapping mapAttributes:@"name", nil];
  return mapping;
}

@end
