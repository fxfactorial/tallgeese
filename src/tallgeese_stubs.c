#define CAML_NAME_SPACE
// OCaml declarations
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/memory.h>
#include <caml/fail.h>
//Cocoa
#import <Cocoa/Cocoa.h>

#include "ssh_gui.h"

CAMLprim value cocoa_ml_start(void)
{
  if (fork () == 0) {
    NSApplication *app = [NSApplication sharedApplication];
    SshGUI *app_delegate = [[SshGUI alloc] init];

    app.mainMenu = [[NSMenu alloc] initWithTitle:@"Hello"];
    app.delegate = app_delegate;
    [app run];
    return Val_unit;
  }
  else{
    exit(0);
  }
}
