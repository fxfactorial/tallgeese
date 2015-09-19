#ifndef SSH_GUI_H
#define SSH_GUI_H

@interface SshGUI : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSWindow *main_window;
@property (strong, nonatomic) NSWindow *about_window;
@property (strong, nonatomic) NSTextView *ssh_output;
@property (strong, nonatomic) NSTextView *zip_code;

@end
#endif
