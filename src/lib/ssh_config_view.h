#ifndef SSH_CONFIG_VIEW_H
#define SSH_CONFIG_VIEW_H

#import <Cocoa/Cocoa.h>
#include "ssh_exts.h"

@interface Ssh_config_view : NSView

@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSString *user_name;

-(NSDictionary*)get_config_options;

@end

#endif
