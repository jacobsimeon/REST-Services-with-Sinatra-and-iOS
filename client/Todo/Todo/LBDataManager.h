//
//  CWDataController.h
//  CWCore
//
//  Created by Jacob Morris on 1/2/12.
//  Copyright (c) 2012 Bluemodus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@protocol LBMappable
+(RKObjectMapping *)rkObjectMapping;
+(RKObjectMapping *)serializationMapping;
@end

extern NSString* const kCWServerBaseUrl;
extern NSString* const kCWLocalStoreFileName;

@interface LBDataManager: NSObject;

@property (nonatomic, retain) RKObjectManager* rkObjectManager;

+(void) setup;
+(LBDataManager *) sharedManager;
+(LBDataManager *) dataManager;

-(NSManagedObjectContext *)moc;

@end
