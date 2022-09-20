//
//  EMVisualEffectView.h
//  Pods
//
//  Created by Elmo on 2022/9/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

API_AVAILABLE(ios(10.0))
@interface EMVisualEffectView : UIVisualEffectView
@property (nullable, nonatomic, strong) UIViewPropertyAnimator *propertyAnimator;
@property (nonatomic, assign) CGFloat blurRadius;
@end

NS_ASSUME_NONNULL_END
