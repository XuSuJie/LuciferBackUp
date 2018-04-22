//
//  ImputMessage.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "ImputMessage.h"

@interface ImputMessage ()

@end

@implementation ImputMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //界面1，2，3的初始化
    _view1=[[ChooseInterestViewController alloc]init];
    [_view1.view setFrame:CGRectMake(0, 150, SCREEN_SIZE.width, SCREEN_SIZE.height-100)];
    _view2=[[PersonalMessage alloc]init];
    [_view2.view setFrame:CGRectMake(0, 150, SCREEN_SIZE.width, SCREEN_SIZE.height-100)];
    _view3=[[RegisterSucceed alloc]init];
    [_view3.view setFrame:CGRectMake(0, 150, SCREEN_SIZE.width, SCREEN_SIZE.height-100)];
    //按钮1，2，3
    _button1=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/3-100, 50, 100, 60)];
    [_button1 setTitle:@"选择兴趣" forState:UIControlStateNormal];
    [_button1 setBackgroundColor:[UIColor blueColor]];
    _button1.tag=0;
    _button2=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-50, 50, 100, 60)];
    [_button2 setTitle:@"完善信息" forState:UIControlStateNormal];
    [_button2 setBackgroundColor:[UIColor grayColor]];
    _button2.tag=1;
    _button3=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/3*2, 50, 100, 60)];
    [_button3 setTitle:@"完成注册" forState:UIControlStateNormal];
    [_button3 setBackgroundColor:[UIColor grayColor]];
    _button3.tag=2;
    //事件响应
    [_button1 addTarget:self action:@selector(showview:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(showview:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(showview:) forControlEvents:UIControlEventTouchUpInside];
    //传参
    _view1.token=_token;
    _view2.token=_token;//传入从注册界面获得的token
    _view1.button=_button1;
    _view2.button=_button2;
    _view3.button=_button3;
    [self.view addSubview:_button1];
    [self.view addSubview:_button2];
    [self.view addSubview:_button3];
    [self addChildViewController:_view1];
    [self addChildViewController:_view2];
    [self addChildViewController:_view3];
    [self.view addSubview:_view1.view];
    _currentView=_view1;
}
-(void)showview:(UIButton* )button{
    //点击了其他按钮
    if(self.childViewControllers[button.tag]!=_currentView){
        [_currentView.view removeFromSuperview];
        if (_currentView==_view1) {
            _view2.Interest=_view1.interest;//标签云的标签数组传到界面2
        }
        [self.view addSubview:self.childViewControllers[button.tag].view];
        _currentView=self.childViewControllers[button.tag];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
