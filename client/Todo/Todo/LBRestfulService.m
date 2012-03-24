//
//  LBModelBase.m
//  CheckInToWin
//
//  Created by Jacob Morris on 1/3/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import "LBRestfulService.h"

NSString * const LBObjectLoaderDelegateTimeoutException = @"LBModelBaseResponseLoaderTimeoutException";

@implementation LBRestfulService

@synthesize awaitingResponse;
@synthesize success;
@synthesize timeout;
@synthesize wasCancelled;
@synthesize unknownResponse;

-(LBRestfulService* )init{
  self = [super init];
  if(self){
    self.timeout = 4;
    self.awaitingResponse = NO;
  }
  return self;
}

- (void)waitForResponse {
	self.awaitingResponse = YES;
	NSDate* startDate = [NSDate date];
		while (awaitingResponse) {		
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
		if ([[NSDate date] timeIntervalSinceDate:startDate] > self.timeout) {
			[NSException raise:LBObjectLoaderDelegateTimeoutException format:@"*** Operation timed out after %f seconds...", self.timeout];
			self.awaitingResponse = NO;
		}
	}
}

- (void)loadError:(NSError*)error {
  NSLog(@"Error: %@", error);
  self.awaitingResponse = NO;
	self.success = NO;
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)_response {
  NSLog(@"Loaded response: %@", _response);
  
  // If request is an Object Loader, then objectLoader:didLoadObjects:
  // will be sent after didLoadResponse:
  if (NO == [request isKindOfClass:[RKObjectLoader class]]) {
    self.awaitingResponse = NO;
    self.success = YES;
  }
}

- (void)request:(RKRequest *)request didFailLoadWithError:(NSError *)error {
  // If request is an Object Loader, then objectLoader:didFailWithError:
  // will be sent after didFailLoadWithError:
  if (NO == [request isKindOfClass:[RKObjectLoader class]]) {
    [self loadError:error];
  }
}

- (void)requestDidCancelLoad:(RKRequest *)request {
  self.awaitingResponse = NO;
  self.success = NO;
  self.wasCancelled = YES;
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)_objects {
	self.awaitingResponse = NO;
	self.success = YES;
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error; {	
  [self loadError:error];
}

- (void)objectLoaderDidLoadUnexpectedResponse:(RKObjectLoader*)objectLoader {
  self.success = NO;
  self.awaitingResponse = NO;
  self.unknownResponse = YES;
}

@end