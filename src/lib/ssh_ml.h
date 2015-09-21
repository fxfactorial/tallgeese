#define CAML_NAME_SPACE

#ifndef SSH_ML_H
#define SSH_ML_H

#include <caml/mlvalues.h>

#import <Cocoa/Cocoa.h>

#include "ssh_gui.h"

// Can cheat with this.
@class Ssh_gui;

// One stop shop for interfacing with OCaml world
// ie callbacks, state, etc.
@interface Ssh_ml : NSObject

@property (weak, nonatomic) Ssh_gui *parent_handler;

-(instancetype)init_with:(Ssh_gui*)handler;

-(void)handle_query_result:(value)r;
-(void)send_ssh_command:(NSString*)command;
-(void)query_zipcode_of_ip:(NSString*)ip;

@end

#endif
