#import <UIKit/UIKit.h>
#import <ActionMenu.h>

@interface UIApplication()
- (void)applicationOpenURL:(NSURL *)url;
@end

@implementation UIResponder (Maps)

- (void)doMaps:(id)sender
{
    NSString *selection = [self selectedTextualRepresentation];
    NSMutableString *string = [[NSMutableString alloc] initWithString:@"maps:q="];
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    
    if ([selection length] > 0) {
        selection = [selection stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    }
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
    id<AMMenuItem> mapsMenu = [[UIMenuController sharedMenuController] registerAction:@selector(doMaps:) title:@"Maps" canPerform:@selector(canDoMaps:)];
    mapsMenu.image = [UIImage imageWithContentsOfFile:@"/Library/ActionMenu/Plugins/Maps.png"];
}

@end

// vim:ft=objc
