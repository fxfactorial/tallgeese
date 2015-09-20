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

+(Ssh_ml*)shared_application
{
	static Ssh_ml *shared_app = nil;

	if (shared_app == nil)
		shared_app = [Ssh_ml new];

	return shared_app;
}

-(void)query_zipcode_of_ip:(NSButton*)b
{
	NSLog(@"Called query_zipcode, %@", b);
}

-(void)handle_query_result:(value)r_variant
{
	NSLog(@"query_Result called");
	char *result = caml_strdup(String_val(Field(r_variant, 0)));
	int type = Tag_val(r_variant);
	NSApplication *app = [NSApplication sharedApplication];

	switch (type) {
	case 0:
		[((SshGUI*)app.delegate).zip_code
				setString:[[NSString alloc] initWithUTF8String:result]];
		break;
	case 1:
		[((SshGUI*)app.delegate).ssh_output
				setString:[[NSString alloc] initWithUTF8String:result]];
		break;
	}
	free(result);

}

@end
