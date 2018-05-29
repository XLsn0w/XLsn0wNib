
#import "XLsn0wNib.h"

#define XLsn0wNibBundle [NSBundle mainBundle]

@implementation XLsn0wNib

///通过xib来创建view
+ (UIView *)loadNib:(NSString *)xibName {
    return [[XLsn0wNibBundle loadNibNamed:xibName owner:nil options:nil] firstObject];
}

///为什么是lastObject，当然firstObject也可以。这让我们想到了数组。而帮助文件是这么解释的

///An array containing the top-level objects in the nib file.（字幕：请求翻译~）
///其实XIB就是一个视图，当然我们不只放一个控件（或许会放一个），我们需要返回最顶部的一个对象给她，
///就好比OC里的数组第一个元素的地址就是这个数组的地址是一个意思。获取到的最顶部对象就能代表这个XIB自身。


@end
