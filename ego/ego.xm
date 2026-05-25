#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import <CydiaSubstrate/CydiaSubstrate.h>

// 仅Hook已知目标类（类级操作，App启动时仅注入1次）
@interface MMTableViewCell : UITableViewCell
@end

// 仅Hook已知目标类（类级操作，App启动时仅注入1次）
@interface MMUILongPressImageView : UIImageView
@end

// ========== 全局静态常量（极简初始化，无上下文错误） ==========
static NSArray *const kTargetCellReuseIDs = @[
    @"WCCellReuseIdentifier_110.000000",
    @"WCCellReuseIdentifier_80.000000",
    @"WCCellReuseIdentifier_56.000000"
];

// ========== Hook MMTableViewCell（隐藏指定复用ID的Cell） ==========
%hook MMTableViewCell
- (void)layoutSubviews {
    %orig; // 执行微信原布局逻辑
    
    // 快速判空+匹配（无冗余消耗）
    NSString *reuseID = self.reuseIdentifier;
    if (!reuseID || !kTargetCellReuseIDs) return;
    
    if ([kTargetCellReuseIDs containsObject:reuseID]) {
        self.hidden = YES;
        self.contentView.hidden = YES;
        
        // 仅有子视图时执行移除（避免空遍历）
        if (self.contentView.subviews.count > 0) {
            [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
    }
}
%end

// ========== Hook MMUILongPressImageView（隐藏头像） ==========
%hook MMUILongPressImageView
- (instancetype)initWithFrame:(CGRect)frame {
    self = %orig(frame);
    if (self) {
        self.hidden = YES; // 核心隐藏，无冗余
    }
    return self;
}

- (void)layoutSubviews {
    %orig;
    self.hidden = YES; // 兜底保持隐藏
}
%end

// 极简注入入口（无任何多余操作）
%ctor {}
