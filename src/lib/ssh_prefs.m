#import <Cocoa/Cocoa.h>

#include "ssh_prefs.h"

@implementation Ssh_prefs

-(instancetype)init
{
	if (self = [super init])
		NSLog(@"Init worked on Ssh_prefs");
	return self;
}

@end
