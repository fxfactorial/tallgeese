#ifndef SSH_GUI_H
#define SSH_GUI_H

#import <Cocoa/Cocoa.h>

#include "ssh_app_prefs.h"
#include "ssh_ml.h"
@class Ssh_ml;

@interface Ssh_gui : NSView <NSToolbarDelegate>

@property (strong, nonatomic) NSWindow *about_window;
@property (strong, nonatomic) Ssh_app_prefs *prefs_object;
@property (strong, nonatomic) NSTextView *ssh_output;
@property (strong, nonatomic) Ssh_ml *ml_bridge;

@property (strong, nonatomic) NSString *ssh_output_string;
@property (strong, nonatomic) NSString *zipcode_output;

-(void)setup_ui;
-(void)receive_zipcode_result:(NSString*)s;
-(void)receive_ssh_output_result:(NSString*)s;

@end
#endif
