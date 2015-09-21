#import <Cocoa/Cocoa.h>

#ifndef SSH_APP_PREFS_H
#define SSH_APP_PREFS_H

@interface Ssh_app_prefs : NSObject

@property (strong, nonatomic) NSWindow *preferences_window;

-(void)show;
@end

#endif
