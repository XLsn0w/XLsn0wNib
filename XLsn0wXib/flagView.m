

#import "flagView.h"

@interface flagView ()

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraint;

@end

@implementation flagView

//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    //通过修改约束达到修改布局的效果
//    self.constraint.constant = 200;
//}


/*
 
 （1）通过Xib创建UI控件，不会调用init和initwith方法。
 
 （2）创建一个控件类，和xib关联，是可以修改Xib中的属性的。
 
 （3）一样会调用layoutSubViews方法
 
 （4）因为通过拖线和配置，已经固定了控件的大小和布局，所以frame可以获得
 
 （5）initWithCoder和 aweakFromNib 在这里作用相同，都被系统调用
 
 
 
 总结及延伸：
 
 当我们弄清楚控制器加载的各种情况后，相对于用代码，使用IB和xib文件来组织UI，可以省下大量代码和时间，从而得到更快的开发速度；同时，Xib最大的问题在于其设置往往并非最终设置，在代码中你将有机会覆盖你在xib文件中进行的UI设计，造成错误和混乱。
 
 
 
 说了好多，总结一下也无非几句话：
 
 1、用Xib创建控件，对于控件的后续操作都写在initWithCoder或aweakFromNib方法中；
 
 2、纯代码写创建的控件，对于控件的后续操作都写在initWithFrame方法中；
 
 3、添加子控件时，注意布局（frame的获得），合理灵活的使用xib加载控件；
 
 4、至于initWithCoder和aweakFromNib的区别在后面再做讨论（关于通过xib加载控制器）。
 */

-(instancetype)init
{
    self=[super init];
    NSLog(@" init =====> 执行了");
    NSLog(@"此时view的frame====》 %@",NSStringFromCGRect(self.frame));
    return self;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    NSLog(@" initWithFrame =====> 执行了");
    NSLog(@"此时view的frame====》 %@",NSStringFromCGRect(self.frame));
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    NSLog(@" initWithCoder =====> 执行了");
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@" awakeFromNib =====> 执行了");
}

-(void)layoutSubviews
{
    NSLog(@" layoutSubviews =====> 执行了");
    NSLog(@"此时view的frame====》 %@",NSStringFromCGRect(self.frame));
    
}

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
