#ifndef SSH_APP_DELEGATE_H
#define SSH_APP_DELEGATE_H

#include "ssh_gui.h"

@interface Ssh_app_delegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSWindow *main_window;
@property (strong, nonatomic) Ssh_gui *app_logic;

@end

#endif
