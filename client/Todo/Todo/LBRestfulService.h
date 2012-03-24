//
//  LBModelBase.h
//  CheckInToWin
//
//  Created by Jacob Morris on 1/3/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//
//  This class provides basic functionality for responding to various RKObjectLoaderDelegate methods
//  Upon a successful response, the delegate will place loaded objects into self.objects
//  Also - the class provides a method for waiting for a response before continuing to execute instructions
//  The waitForResponse: method should only be called by a unit test NOT PRODUCTION CODE.
//  

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import <RestKit/RKErrorMessage.h>

@interface LBRestfulService : NSObject <RKObjectLoaderDelegate> {
	BOOL awaitingResponse;
	BOOL success;
  BOOL wasCancelled;
  BOOL unknownResponse;
	NSTimeInterval timeout;
}

@property (nonatomic, assign) BOOL awaitingResponse;
@property (nonatomic, assign) BOOL success; 
@property (nonatomic, assign) BOOL wasCancelled;
@property (nonatomic, assign) BOOL unknownResponse;
@property (nonatomic, assign) NSTimeInterval timeout;

-(void) waitForResponse;

@end
