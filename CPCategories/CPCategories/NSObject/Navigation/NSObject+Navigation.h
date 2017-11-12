//
//  NSObject+Navigation.h
//  CPCategories
//
//  Created by casa on 2017/11/12.
//  Copyright © 2017年 casa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (Navigation)

- (void)cp_pushViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
- (void)cp_presentViewController:(UIViewController * _Nonnull)viewControllerToPresent animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

@end
