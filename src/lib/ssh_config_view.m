#import <Cocoa/Cocoa.h>

#include "ssh_exts.h"
#include "ssh_config_view.h"

@implementation Ssh_config_view

-(instancetype) init
{
	if ((self = [super init])) {
		[self setup_config_ui];
	}
	return self;
}

-(void)setup_config_ui
{
	[self addSubview:
					[[NSTextField alloc] init_as_label:@"Username: " with:NSMakeRect(0, 525, 100, 20)]];
	[self addSubview:
					[[NSTextField alloc] init_as_label:@"Ssh machine: " with:NSMakeRect(0, 480, 100, 20)]];

	self.username = [[NSTextField alloc] initWithFrame:NSMakeRect(100, 520, 200, 20)];
	self.destination = [[NSTextField alloc] initWithFrame:NSMakeRect(100, 475, 200, 20)];

	for (NSTextField *f in @[self.username, self.destination])
		[self addSubview:f];
}

-(NSDictionary*)get_config_options
{
	return @{@"username":self.username.stringValue, @"dest":self.destination.stringValue};
}

@end
