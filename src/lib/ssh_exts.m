#import <Cocoa/Cocoa.h>

#include "ssh_exts.h"

@implementation NSTextField (PlainLabel)

-(instancetype)init_as_label:(NSString*)s
{
	if (self = [super initWithFrame:NSMakeRect(0, 0, 0, 0)]) {
		self.editable = NO;
		self.bezeled = NO;
		self.drawsBackground = NO;
		self.selectable = NO;
		self.stringValue = s;
		[self sizeToFit];
	}
	return self;
}

@end
