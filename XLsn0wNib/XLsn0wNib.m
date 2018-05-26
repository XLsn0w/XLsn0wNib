
#import "XLsn0wNib.h"

#define XLsn0wNibBundle [NSBundle mainBundle]

@implementation XLsn0wNib

///通过xib来创建view
+ (UIView *)loadNib:(NSString *)xibName {
    return [[XLsn0wNibBundle loadNibNamed:xibName owner:nil options:nil] firstObject];
}


@end
