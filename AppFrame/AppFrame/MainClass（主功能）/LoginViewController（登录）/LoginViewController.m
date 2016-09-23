


//
//  LoginViewController.m
//  lightcar
//
//  Created by 李文韬 on 15/8/31.
//  Copyright (c) 2015年 TD_. All rights reserved.
//

#import "LoginViewController.h"



#define  TestUserName

@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField *_phoneField;
    UITextField *_codeField;
    UIButton *_codeBtn;
    NSInteger _timeCount;
    NSTimer *_timer;
    
    
  
}
@end

@implementation LoginViewController

- (void)dealloc
{
    NSLog(@"LoginViewController release");
    
    [_phoneField removeFromSuperview];
    _phoneField.delegate = nil;
    _phoneField = nil;
    
    [_codeField removeFromSuperview];
    _codeField.delegate = nil;
    _codeField = nil;
    
    [_codeBtn removeFromSuperview];
    _codeBtn = nil;
    
  
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    UIImageView *imageBG = [[UIImageView alloc] initWithFrame:SCREEN_BOUNDS];
    imageBG.image = [UIImage imageNamed:@"login_bg"];
    imageBG.userInteractionEnabled = YES;
    [self.view addSubview:imageBG];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyBord)];
    [imageBG addGestureRecognizer:tap];
    
    [self setContentView];
    
    //是否第一次启动
    
//    if ([UserManager isFirstOpen])
//    {
//        [self setGuidePageView];
//    }
    
}

// 引导页
//- (void)setGuidePageView
//{
//    if (_pageView) return;
//    
//    _pageView = [[Lwt_PageScrollView alloc] initWithFrame:SCREEN_BOUNDS animationDuration:0];
//    _pageView.totalPagesCount = ^NSInteger (void)
//    {
//        return 4;
//    };
//    _pageView.fetchContentViewAtIndex =  ^UIView *(NSInteger index)
//    {
//    
//        return nil;
//    };
//    
//    _pageView.TapActionBlock = ^(NSInteger index)
//    {
//        NSLog(@"%d",index);
//    };
//    
//}


//内容页
- (void)setContentView
{
//    UIImage *image = [UIImage imageNamed:@"login_icon"];
//    CGFloat image_W = image.size.width*GETSCALE_X;
//    CGFloat image_H = image.size.height*GETSCALE_X;
//    
//    UIImageView *icon = [[UIImageView alloc] initForAutoLayout];
//    icon.image = image;
//    [self.view addSubview:icon];
//    [icon autoAlignAxisToSuperviewAxis:ALAxisVertical];
//    [icon autoSetDimensionsToSize:CGSizeMake(image_W, image_H)];
//    [icon autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:Icon_Top_Edge];
//    
//    UILabel *label = [[UILabel alloc] initForAutoLayout];
//    label.font = TextFont_BIG;
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor whiteColor];
//    label.text = @"长颈鹿停车";
//    [self.view addSubview:label];
//    [label autoSetDimensionsToSize:CGSizeMake(SCREEN_WIDTH,40)];
//    [label autoPinEdgeToSuperviewEdge:ALEdgeLeft];
//    [label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:icon];
//    
//    UIImage *fieldBg = [[UIImage imageNamed:@"login_code_edi"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
//  
//    _phoneField = [[UITextField alloc] initForAutoLayout];
//    _phoneField.borderStyle = UITextBorderStyleNone;
//    _phoneField.font = TextFont_MEDIUM;
//    _phoneField.textColor = [UIColor whiteColor];
//    _phoneField.placeholder = @"手机号";
//    _phoneField.text = [UserManager getPhone];
//    _phoneField.background = fieldBg;
//    _phoneField.delegate = self;
//    _phoneField.returnKeyType = UIReturnKeyDone;
//    _phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _phoneField.keyboardType = UIKeyboardTypeNumberPad;
//    [_phoneField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [self.view addSubview:_phoneField];
//    [_phoneField autoSetDimension:ALDimensionHeight toSize:fieldBg.size.height];
//    [_phoneField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label];
//    [_phoneField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:Space_Edge];
//    [_phoneField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:Space_Edge];
//    
//    UIImage *icon_user = [UIImage imageNamed:@"login_icon_user"];
//    UIImageView *icon_userView = [[UIImageView alloc] initForAutoLayout];
//    icon_userView.image = icon_user;
//    _phoneField.leftView = icon_userView;
//    _phoneField.leftViewMode = UITextFieldViewModeAlways;
//    
//    
//    _codeField = [[UITextField alloc] initForAutoLayout];
//    _codeField.borderStyle = UITextBorderStyleNone;
//    _codeField.font = TextFont_MEDIUM;
//    _codeField.textColor = [UIColor whiteColor];
//    _codeField.placeholder = @"输入验证码";
//    _codeField.background = fieldBg;
//    _codeField.delegate = self;
//    _codeField.returnKeyType = UIReturnKeyDone;
//    _codeField.clearButtonMode = UITextFieldViewModeWhileEditing;
//    _codeField.keyboardType = UIKeyboardTypeNumberPad;
//    [_codeField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [self.view addSubview:_codeField];
//    [_codeField autoSetDimensionsToSize:CGSizeMake(110*GETSCALE_X,fieldBg.size.height)];
//    [_codeField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_phoneField withOffset:10];
//    [_codeField autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_phoneField];
//    
//    UIView *spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15,VIEW_H(_codeField))];
//    spaceView.backgroundColor = [UIColor clearColor];
//    _codeField.leftView = spaceView;
//    _codeField.leftViewMode = UITextFieldViewModeAlways;
//    UIImage *codeBg = [[UIImage imageNamed:@"login_codeBtn"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
//    _codeBtn = [[UIButton alloc] initForAutoLayout];
//    _codeBtn.titleLabel.font = TextFont_MEDIUM;
//    [_codeBtn setBackgroundImage:codeBg forState:UIControlStateNormal];
//    [_codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//    [_codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_codeBtn];
//    [_codeBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_codeField withOffset:30];
//    [_codeBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_phoneField];
//    [_codeBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_codeField];
//    [_codeBtn autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_codeField];
//    
//    UIButton *loginBtn = [[UIButton alloc] initForAutoLayout];
//    loginBtn.backgroundColor = TextColor_Yellow;
//    loginBtn.titleLabel.font = TextFont_BIG;
//    loginBtn.layer.cornerRadius = 7;
//    [loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
//    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:loginBtn];
//    [loginBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_phoneField];
//    [loginBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_phoneField];
//    [loginBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_codeBtn withOffset:10];
//    [loginBtn autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_phoneField];
//    
//    UILabel *actLabel = [[UILabel alloc] initForAutoLayout];
//    actLabel.font = TextFont_SMALL;
//    actLabel.textColor = [UIColor whiteColor];
//    actLabel.textAlignment = NSTextAlignmentCenter;
//    actLabel.numberOfLines = 0;
//    actLabel.text = @"温馨提示：新用户获取验证码可以直接注册登录哟~";
//    [self.view addSubview:actLabel];
//    [actLabel autoSetDimension:ALDimensionHeight toSize:40];
//    [actLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
//    [actLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
//    [actLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:loginBtn withOffset:10];
    
    
}


#pragma mark - 事件

- (void)codeBtnClick
{
    if (![_phoneField.text isPhoneNo] )
    {
       
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号码"];return;
    }
    
    
#ifdef  TestUserName //测试账户
    
    if ([_phoneField.text isEqualToString:@"13058109584"])
    {
        
          [SVProgressHUD showErrorWithStatus:@"验证码发送成功"];return;
      
        dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, 1.5*NSEC_PER_SEC);
        dispatch_after(poptime, dispatch_get_main_queue(), ^{
            _timeCount = 60;
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
            [self timeCount];
        });
        
        return;
    }
    
#endif
 
    
    [SVProgressHUD show];
    

//    [RequestManager GetCodeRequestWithPhone:_phoneField.text Succeed:^(NSDictionary *result) {
//    
//    [self hiddenActityHoldView];
//      NSString *resultCode = [NSString stringWithFormat:@"%@",[[result objectForKey:@"result"] objectForKey:@"resultCode"]];
//        if ([resultCode isEqualToString:@"0000"])
//        {
//            [self addActityText:@"验证码发送成功" deleyTime:1.5];
//            dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, 1.5*NSEC_PER_SEC);
//            dispatch_after(poptime, dispatch_get_main_queue(), ^{
//                _timeCount = 60;
//                _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeCount) userInfo:nil repeats:YES];
//                [self timeCount];
//            });
//        }else
//        {
//            [self addActityText:@"获取失败，稍后再试" deleyTime:1];
//        }
//        
//    } Faild:^(NSString *errStr) {
//        [self hiddenActityHoldView];
//        [self addActityText:errStr deleyTime:1];
//    }];
//    
    
   
}


- (void)timeCount
{
    _timeCount --;
    _codeBtn.enabled = NO;
    [_codeBtn setTitle:[NSString stringWithFormat:@"%02d秒重新发送",_timeCount] forState:UIControlStateDisabled];
    if (_timeCount == -1)
    {
        _codeBtn.enabled = YES;
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
    }
}


- (void)loginBtnClick
{
    
//    [NotificationCenter postNotificationName:@"LoginSuccee" object:nil]; return;
    
    if (![self isUserNameOk]) return;
    [SVProgressHUD show];
//    [RequestManager RegisterRequestWithPhone:_phoneField.text Code:_codeField.text Succeed:^(NSDictionary *result) {
//        [self hiddenActityHoldView];
//        NSString *resultCode = [NSString stringWithFormat:@"%@",[[result objectForKey:@"result"] objectForKey:@"resultCode"]];
//        if ([resultCode isEqualToString:@"0000"] || [resultCode isEqualToString:@"1002"])
//        {
//            [self registerSuccecfull:[result objectForKey:@"result"]];
//        }else if([resultCode isEqualToString:@"1007"])
//        {
//            [self addActityText:@"验证码不正确" deleyTime:1];
//        }else
//        {
//            [self addActityText:@"系统异常" deleyTime:1];
//        }
//    } Faild:^(NSString *errStr) {
//        [self hiddenActityHoldView];
//        [self addActityText:errStr deleyTime:1];
//    }];
}

- (void)registerSuccecfull:(NSDictionary *)result
{

    //保存信息
    
//    NSLog(@"%@",result_Y);
//    [UserManager saveUserInfo:result_Y];
//    [UserManager autoLogin:YES];
    

    
    [self hiddenKeyBord];
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, 0.5*NSEC_PER_SEC);
    dispatch_after(poptime, dispatch_get_main_queue(), ^{
        [NotificationCenter postNotificationName:@"LoginSuccee" object:nil];
    });
}


- (void)hiddenKeyBord
{
    [self.view endEditing:YES];
}


#pragma mark - 功能
- (BOOL)isUserNameOk
{
    
    if (![_phoneField.text isPhoneNo] )
    {
        
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号码"];return NO;
       
    }
    
    if ([_codeField.text length] == 0)
    {
         [SVProgressHUD showErrorWithStatus:@"请输入验证码"];return NO;
   
    }
    
    if ([_codeField.text length] > 4)
    {
         [SVProgressHUD showErrorWithStatus:@"验证码错误"];return NO;
        
    }
    
    return YES;
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end


