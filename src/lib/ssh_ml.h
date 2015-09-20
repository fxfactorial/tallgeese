#ifndef SSH_ML_H
#define SSH_ML_H

#import <Cocoa/Cocoa.h>

// One stop shop for interfacing with OCaml world
// ie callbacks, state, etc.
@interface Ssh_ml : NSObject

+(Ssh_ml*)shared_application;

@end

#endif
