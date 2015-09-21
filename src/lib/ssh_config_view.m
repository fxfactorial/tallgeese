#import <Cocoa/Cocoa.h>

#include "ssh_exts.h"
#include "ssh_config_view.h"

@implementation Ssh_config_view

-(instancetype) init
{
	if (self = [super init]) {
		[self addSubview: [[NSTextField alloc] init_as_label:@"Test"]];
	}
	NSLog(@"Created");
	return self;
}

-(NSDictionary*)get_config_options
{
	NSLog(@"Need to collect items");
	return nil;
}

@end
