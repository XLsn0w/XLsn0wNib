

#import "flagView.h"

@interface flagView ()

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

@end

@implementation flagView

+(instancetype)flagview
{   //通过xib来创建view
    NSBundle * rootBundle=[NSBundle mainBundle];
    flagView * view=[[rootBundle loadNibNamed:@"flagView" owner:nil options:nil]firstObject];
    return view;
}
+(CGFloat)rowHeight
{
    return 100;
}
-(void)setFlag:(FlagModel *)flag
{
    _flag=flag;
    
    
}
@end
