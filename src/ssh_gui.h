#ifndef SSH_GUI_H
#define SSH_GUI_H

@interface SshGUI : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSWindow *window;
@property (strong, nonatomic) NSTextView *ssh_output;

@end
#endif
