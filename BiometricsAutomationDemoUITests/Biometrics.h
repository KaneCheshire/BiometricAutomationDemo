//
//  Biometrics.h
//  BiometricsAutomationDemoUITests
//
//  Created by Kane Cheshire on 31/10/2018.
//  Copyright © 2018 kane.codes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Biometrics : NSObject

+ (void)enrolled;
+ (void)unenrolled;
+ (void)successfulAuthentication;
+ (void)unsuccessfulAuthentication;

@end

NS_ASSUME_NONNULL_END
