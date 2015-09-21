#define CAML_NAME_SPACE
// OCaml declarations
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/memory.h>
#include <caml/fail.h>
//Cocoa
#import <Cocoa/Cocoa.h>

#include "ssh_app_delegate.h"
#include "ssh_ml.h"

CAMLprim value cocoa_ml_receive_query_result(value r_variant)
{
	CAMLparam1(r_variant);

	NSApplication *app = [NSApplication sharedApplication];
	[((Ssh_app_delegate*)app.delegate).app_logic.ml_bridge
	 handle_query_result:r_variant];

	CAMLreturn(Val_unit);
}

CAMLprim value cocoa_ml_start(void)
{
  CAMLparam0 ();
  if (fork () == 0) {
    NSApplication *app = [NSApplication sharedApplication];
    // Critical to have this so that you can add menus
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];

    Ssh_app_delegate *app_delegate = [Ssh_app_delegate new];
    /* close(STDOUT_FILENO); */
    /* fclose(stdout); */
    app.delegate = app_delegate;
    [app run];
    CAMLreturn(Val_unit);
  }
  else{
    exit(0);
    CAMLreturn(Val_unit);
  }
}
