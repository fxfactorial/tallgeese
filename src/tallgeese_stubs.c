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

CAMLprim value cocoa_ml_receive_query_result(value result_string)
{

	CAMLparam1(result_string);
	char *result = String_val(result_string);
	NSApplication *app = [NSApplication sharedApplication];
	[((SshGUI*)app.delegate).ssh_output
	 setString:[[NSString alloc] initWithUTF8String:result]];
	CAMLreturn(Val_unit);
}

CAMLprim value cocoa_ml_start(void)
{
  if (fork () == 0) {
    NSApplication *app = [NSApplication sharedApplication];
    SshGUI *app_delegate = [[SshGUI alloc] init];

    app.delegate = app_delegate;
    [app run];
    return Val_unit;
  }
  else{
    exit(0);
  }
}
