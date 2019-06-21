#import <UIKit/UIKit.h>
#import <MenuSupport.h>

@interface UIApplication()
- (void)applicationOpenURL:(NSURL *)url;
@end

@implementation UIResponder (Maps)

- (void)doMaps:(id)sender
{
    NSString *selection = [self ms_selectedTextualRepresentation];
    NSMutableString *string = [[NSMutableString alloc] initWithString:@"maps:q="];
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    
    if ([selection length] > 0) {
        selection = [selection stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    }
    [string appendFormat:@"%@",selection];
    
    if ([identifier isEqualToString:@"com.apple.springboard"]){
        [[UIApplication sharedApplication] applicationOpenURL:[NSURL URLWithString:string]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string] options:@{} completionHandler:nil];
    }
    [string release];
}

- (BOOL)canDoMaps:(id)sender
{
    return [self respondsToSelector:@selector(insertText:)];
}

+ (void)load
{
    id<MSMenuItem> mapsMenu = [[UIMenuController sharedMenuController] ms_registerAction:@selector(doMaps:) title:@"Maps" canPerform:@selector(canDoMaps:)];
    mapsMenu.image = [UIImage imageWithContentsOfFile:@"/Library/MenuSupport/Plugins/Maps.png"];
}

@end

// vim:ft=objc
