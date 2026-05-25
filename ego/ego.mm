#line 1 "/Users/pandora/Documents/Saved Projects/ego/ego/ego.xm"
#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import <CydiaSubstrate/CydiaSubstrate.h>


@interface MMTableViewCell : UITableViewCell
@end


@interface MMUILongPressImageView : UIImageView
@end


static NSArray *const kTargetCellReuseIDs = @[
    @"WCCellReuseIdentifier_110.000000",
    @"WCCellReuseIdentifier_80.000000",
    @"WCCellReuseIdentifier_56.000000"
];



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__asm__(".linker_option \"-framework\", \"CydiaSubstrate\"");

@class MMUILongPressImageView; @class MMTableViewCell; 
static void (*_logos_orig$_ungrouped$MMTableViewCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL MMTableViewCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMTableViewCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MMTableViewCell* _LOGOS_SELF_CONST, SEL); static MMUILongPressImageView* (*_logos_orig$_ungrouped$MMUILongPressImageView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT MMUILongPressImageView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static MMUILongPressImageView* _logos_method$_ungrouped$MMUILongPressImageView$initWithFrame$(_LOGOS_SELF_TYPE_INIT MMUILongPressImageView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$MMUILongPressImageView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL MMUILongPressImageView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MMUILongPressImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MMUILongPressImageView* _LOGOS_SELF_CONST, SEL); 

#line 24 "/Users/pandora/Documents/Saved Projects/ego/ego/ego.xm"

static void _logos_method$_ungrouped$MMTableViewCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MMTableViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MMTableViewCell$layoutSubviews(self, _cmd); 
    
    
    NSString *reuseID = self.reuseIdentifier;
    if (!reuseID || !kTargetCellReuseIDs) return;
    
    if ([kTargetCellReuseIDs containsObject:reuseID]) {
        self.hidden = YES;
        self.contentView.hidden = YES;
        
        
        if (self.contentView.subviews.count > 0) {
            [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        }
    }
}




static MMUILongPressImageView* _logos_method$_ungrouped$MMUILongPressImageView$initWithFrame$(_LOGOS_SELF_TYPE_INIT MMUILongPressImageView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
    self = _logos_orig$_ungrouped$MMUILongPressImageView$initWithFrame$(self, _cmd, frame);
    if (self) {
        self.hidden = YES; 
    }
    return self;
}

static void _logos_method$_ungrouped$MMUILongPressImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MMUILongPressImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MMUILongPressImageView$layoutSubviews(self, _cmd);
    self.hidden = YES; 
}



static __attribute__((constructor)) void _logosLocalCtor_f7ab6c97(int __unused argc, char __unused **argv, char __unused **envp) {}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MMTableViewCell = objc_getClass("MMTableViewCell"); { MSHookMessageEx(_logos_class$_ungrouped$MMTableViewCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$MMTableViewCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$MMTableViewCell$layoutSubviews);}Class _logos_class$_ungrouped$MMUILongPressImageView = objc_getClass("MMUILongPressImageView"); { MSHookMessageEx(_logos_class$_ungrouped$MMUILongPressImageView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$MMUILongPressImageView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$MMUILongPressImageView$initWithFrame$);}{ MSHookMessageEx(_logos_class$_ungrouped$MMUILongPressImageView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$MMUILongPressImageView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$MMUILongPressImageView$layoutSubviews);}} }
#line 62 "/Users/pandora/Documents/Saved Projects/ego/ego/ego.xm"
