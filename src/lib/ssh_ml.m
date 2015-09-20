// Avoid name_clashes
#define CAML_NAME_SPACE

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctype.h>
#include <string.h>
// OCaml declarations
#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/memory.h>
#include <caml/fail.h>

#import <Cocoa/Cocoa.h>

#include "ssh_ml.h"

@implementation Ssh_ml

+(Ssh_ml*)shared_application
{
	static Ssh_ml *shared_app = nil;

	if (shared_app == nil)
		shared_app = [Ssh_ml new];

	return shared_app;
}


@end
