#import "RootViewController.h"
UILabel *firstLabel;
UIButton *begin;
UIButton *install;
@implementation RootViewController
- (void)alertView:(UIAlertView *)input clickedButtonAtIndex:(NSInteger)buttonIndex {
if (buttonIndex == 1) {
NSString *name;
NSString *message;
NSString *exec;
name = [[input textFieldAtIndex:0] text];
message = name = [NSString stringWithFormat:@"%@.ipa was installed", name];
exec = [NSString stringWithFormat:@"installipa /User/Installous/%@.ipa",name];
system([exec UTF8String]);
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
[alert setTag:1000000];
[alert show];
[alert release];
}
}
- (void)install {
UIAlertView *input= [[UIAlertView alloc] initWithTitle:@"iPA name" message:@"Enter iPA name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Install", nil];
input.alertViewStyle = UIAlertViewStylePlainTextInput;
[input show];
}
- (void)installAll {
system("installipa /User/Installous/*.ipa");
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done" message:@"All iPAs from /var/mobile/Installous were installed." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
[alert setTag:1000000];
[alert show];
[alert release];
}
- (void)begin {
install = [UIButton buttonWithType:UIButtonTypeRoundedRect];
install.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, [UIScreen mainScreen].bounds.size.height - 250, 300, 70);
[install setTitle:@"Install by name" forState:UIControlStateNormal];
[install addTarget:self action:@selector(install) forControlEvents:UIControlEventTouchUpInside];
[install.titleLabel setFont:[UIFont systemFontOfSize:35]];
[install setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
[install setBackgroundColor: [UIColor colorWithRed:0.36 green:0.15 blue:0.74 alpha:0.4]];
install.layer.cornerRadius = 15;
[self.view addSubview:install];
[begin setTitle:@"Install all" forState:UIControlStateNormal];
[begin addTarget:self action:@selector(installAll) forControlEvents:UIControlEventTouchUpInside];
}
- (void)loadView {
system("mkdir /User/Installous");
self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
blurEffectView.frame = self.view.bounds;
blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
[self.view addSubview:blurEffectView];
firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, 100)];
firstLabel.text = @"InstallousX";
firstLabel.textColor = [UIColor whiteColor];
firstLabel.textAlignment = UITextAlignmentCenter;
[firstLabel setFont:[UIFont systemFontOfSize:50]];
[self.view addSubview: firstLabel];
UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, [UIScreen mainScreen].bounds.size.width, 50)];
secondLabel.text = @"Reborn from the ashes";
secondLabel.textColor = [UIColor whiteColor];
secondLabel.textAlignment = UITextAlignmentCenter;
[secondLabel setFont:[UIFont systemFontOfSize:20]];
[self.view addSubview: secondLabel];
begin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
begin.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 150, [UIScreen mainScreen].bounds.size.height - 150, 300, 70);
[begin setTitle:@"Begin" forState:UIControlStateNormal];
[begin addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
[begin.titleLabel setFont:[UIFont systemFontOfSize:35]];
[begin setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
[begin setBackgroundColor: [UIColor colorWithRed:0.36 green:0.15 blue:0.74 alpha:0.4]];
begin.layer.cornerRadius = 15;
[self.view addSubview:begin];
}
@end
