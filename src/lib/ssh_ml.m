// Avoid name_clashes
#define CAML_NAME_SPACE
//Standard library
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

#include "ssh_gui.h"
#include "ssh_ml.h"

@implementation Ssh_ml

-(instancetype)init_with:(Ssh_gui*)handler
{
	if ((self = [super init])) {
		self.parent_handler = handler;
	}
	return self;
}

-(void)query_zipcode_of_ip:(NSString*)ip
{

	// caml_callback(*caml_named_value("zipcode_of_ip"),
  // 		 caml_copy_string("45.33.64.41"));

	NSLog(@"Called query_zipcode, %@", ip);
}

-(void)send_ssh_command:(NSString*)user host:(NSString*)host command:(NSString*)command
{
	caml_callback3(*caml_named_value("do_exec"),
								 caml_copy_string(host.UTF8String),
								 caml_copy_string(user.UTF8String),
								 caml_copy_string(command.UTF8String));
}

-(void)handle_query_result:(value)r_variant
{
	char *result = caml_strdup(String_val(Field(r_variant, 0)));
	int type = Tag_val(r_variant);
	NSString *pulled = [[NSString alloc] initWithUTF8String:result];

	switch (type) {
	case 0:
		[self.parent_handler receive_zipcode_result:pulled];
		break;
	case 1:
		[self.parent_handler receive_ssh_output_result:pulled];
		break;
	}
	free(result);
}

@end
