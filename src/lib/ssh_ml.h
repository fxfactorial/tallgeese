#define CAML_NAME_SPACE

#ifndef SSH_ML_H
#define SSH_ML_H

#include <caml/mlvalues.h>

#import <Cocoa/Cocoa.h>

// One stop shop for interfacing with OCaml world
// ie callbacks, state, etc.
@interface Ssh_ml : NSObject

+(Ssh_ml*)shared_application;

-(void)query_zipcode_of_ip:(NSButton*)b;
-(void)handle_query_result:(value)r;

@end

#endif
