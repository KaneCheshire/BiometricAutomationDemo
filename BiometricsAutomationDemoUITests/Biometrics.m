//
//  Biometrics.m
//  BiometricsAutomationDemoUITests
//
//  Created by Kane Cheshire on 31/10/2018.
//  Copyright © 2018 kane.codes. All rights reserved.
//

#import "Biometrics.h"
#import "notify.h"

@implementation Biometrics

+ (void)enrolled {
    [self postEnrollment:true];
}

+ (void)unenrolled {
    [self postEnrollment:false];
}

+ (void)successfulAuthentication {
    notify_post("com.apple.BiometricKit_Sim.fingerTouch.match");
    notify_post("com.apple.BiometricKit_Sim.pearl.match");
}

+ (void)unsuccessfulAuthentication {
    notify_post("com.apple.BiometricKit_Sim.fingerTouch.nomatch");
    notify_post("com.apple.BiometricKit_Sim.pearl.nomatch");
}

+ (void)postEnrollment:(BOOL)isEnrolled {
    int token;
    notify_register_check("com.apple.BiometricKit.enrollmentChanged", &token);
    notify_set_state(token, isEnrolled);
    notify_post("com.apple.BiometricKit.enrollmentChanged");
}

@end
