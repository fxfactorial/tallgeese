#import <Cocoa/Cocoa.h>

#include "ssh_exts.h"

@implementation NSTextField (PlainLabel)

-(instancetype)init_as_label:(NSString*)s
{
	if (self = [super init]) {
		self.stringValue = s;
		self.editable = NO;
		self.drawsBackground = NO;
		self.selectable = NO;
		[self sizeToFit];
	}
	return self;
}

@end
