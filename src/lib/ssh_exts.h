// Categories and general utilities.

#ifndef SSH_EXTS_H
#define SSH_EXTS_H

#import <Cocoa/Cocoa.h>

@interface NSTextField (PlainLabel)

-(instancetype)init_as_label:(NSString*)s with:(NSRect)f;

@end

@interface NSTabViewItem (WithLabel)

-(instancetype)init_with:(NSString*)l tool_tip:(NSString*)t identifier:(id)i;

@end

#endif
