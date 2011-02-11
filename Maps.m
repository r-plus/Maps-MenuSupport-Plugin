#import <UIKit/UIKit.h>
#import "ActionMenu.h"
#import <SpringBoard/SpringBoard.h>

@implementation UIResponder (Maps)

- (void)doMaps:(id)sender
{
	NSString *selection = [self selectedTextualRepresentation];
	NSMutableString *string = [[NSMutableString alloc] initWithString:@"maps:q="];
	NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
	
  if ([selection length] > 0) { selection = [selection stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; }
  [string appendFormat:@"%@",selection];
	
	if ([identifier isEqualToString:@"com.apple.springboard"]){
		[[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:string]];
	} else {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
	}
	[string release];
}

- (BOOL)canDoMaps:(id)sender
{
	return [self respondsToSelector:@selector(insertText:)];
}

+ (void)load
{
	static BOOL isPad;
	
	NSString* model = [[UIDevice currentDevice] model];
	isPad = [model isEqualToString:@"iPad"];
	
	id<AMMenuItem> mapsMenu = [[UIMenuController sharedMenuController] registerAction:@selector(doMaps:) title:@"Maps" canPerform:@selector(canDoMaps:)];
	
	if (!isPad && [[UIScreen mainScreen] scale] == 2.0 ) {
		mapsMenu.image = [[UIImage alloc] initWithContentsOfFile:@"/Library/ActionMenu/Plugins/Maps@2x.png"];
	} else {
		mapsMenu.image = [[UIImage alloc] initWithContentsOfFile:@"/Library/ActionMenu/Plugins/Maps.png"];
	}
}

@end

// vim:ft=objc
