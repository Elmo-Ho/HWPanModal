//
//  EMVisualEffectView.m
//  Pods
//
//  Created by Elmo on 2022/9/20.
//

#import "EMVisualEffectView.h"
@interface EMVisualEffectView ()

@property (nonatomic, strong) UIVisualEffect *blurEffect;

@end
@implementation EMVisualEffectView

- (instancetype)initWithEffect:(UIVisualEffect *)effect {
    self = [super initWithEffect:effect];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.blurRadius = 0.0;
        self.blurEffect = effect;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateVisualEffectView];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self updateVisualEffectView];
}

- (void)updateVisualEffectView {
    self.effect = nil;
    if (@available(iOS 10.0, *)) {
        if (self.propertyAnimator != nil) {
            [self.propertyAnimator stopAnimation:YES];
        }
        self.propertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:0.25 curve:UIViewAnimationCurveLinear animations:^{
            self.effect = self.blurEffect;
        }];
        self.propertyAnimator.fractionComplete = self.blurRadius;
    }
}
- (void)setBlurRadius:(CGFloat)blurRadius {
    _blurRadius = blurRadius;
    self.propertyAnimator.fractionComplete = self.blurRadius;
}
- (void)dealloc {
    [self.propertyAnimator stopAnimation:YES];
}
@end
