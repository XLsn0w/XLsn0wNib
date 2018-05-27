
#import <UIKit/UIKit.h>

@class FlagModel;

@interface flagView : UIView

@property (nonatomic ,strong)FlagModel *flag;

+(instancetype)flagview;
//这里最好设置个返回高度的方法以后改可以在这里改
+(CGFloat)rowHeight;
@end
