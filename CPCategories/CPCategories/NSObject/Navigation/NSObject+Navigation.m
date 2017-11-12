//
//  NSObject+Navigation.m
//  CPCategories
//
//  Created by casa on 2017/11/12.
//  Copyright © 2017年 casa. All rights reserved.
//

#import "NSObject+Navigation.h"

@implementation NSObject (Navigation)

- (UIViewController *)topmostViewController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

- (void)cp_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UINavigationController *navigationController = (UINavigationController *)[self topmostViewController];
    if ([navigationController isKindOfClass:[UINavigationController class]] == NO) {
        navigationController = navigationController.navigationController;
    }
    
    if (navigationController != nil) {
        [navigationController pushViewController:viewController animated:animated];
    }
}

- (void)cp_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated completion:(void (^)(void))completion
{
    UIViewController *viewController = [self topmostViewController];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        viewController = navigationController.topViewController;
    }
    
    if (viewController) {
        [viewController presentViewController:viewControllerToPresent animated:animated completion:completion];
    }
}

@end
