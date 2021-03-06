//
//  TestScrollView.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/22.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "TestScrollView.h"

@interface TestScrollView ()
@property UIButton* btn;
@end

@implementation TestScrollView
static const int viewCount = 3;
#define tablename @"AbilityTestQuestion"
- (instancetype)init
{
    self = [super init];
    if (self) {
        _scrollView = [[UIScrollView alloc] init];
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(50, 430, 240, 30)];
        _viewArray = [[NSMutableArray alloc]init];
        _btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-50, 630, 100, 35)];
        _qaArray = [[NSMutableArray alloc]initWithCapacity:10];
        //数据库数据导入
        Database* db=[Database defaultDB];
        [db openDB:@"zkb.sqlite"];//打开数据库
        //创建表和字段
        [db createTableWithColumnsType:@"no integer PRIMARY KEY AUTOINCREMENT,question text,trueanswer text,userAnswer text,tkselect blob" tableName:tablename];
        
        //for (int i = 0; i<10; i++) {
           // [db insertSQLWithQuestion:@"'如果昨天是明天的话就好了，这样今天就周五了。真实的今天可能是星期几？'" Trueanswer:@"A" UserAnswer:@"3" Array:@[@"A：星期三", @"B：星期四", @"C：星期五"]];
        //}
        
//        [db insertSQLWithColumnName:@"question,trueanswer,userAnswer" columnValue:@"'如果昨天是明天的话就好了，这样今天就周五了。真实的今天可能是星期几？','A','3'" tableName:tablename];
//        [db insertSQLWithColumnName:@"tkselect" array:@[@"A：星期三", @"B：星期四", @"C：星期五"] tableName:tablename];
        sqlite3_stmt *result = [db selectSQLWithColumns:@"question,trueanswer,userAnswer,tkselect" where:nil limit:10 tableName:tablename];
        while (sqlite3_step(result) == SQLITE_ROW) {
            NSMutableDictionary* mutDictionary=[[NSMutableDictionary alloc]initWithCapacity:4];
            char *question_c = (char *)sqlite3_column_text(result,0);
            char *trueanswer_c = (char *)sqlite3_column_text(result,1);
            char *userAnswer_c = (char *)sqlite3_column_text(result,2);
            const void *tkselectData = sqlite3_column_blob(result,3);
            int size = sqlite3_column_bytes(result, 3);
            NSData* data = [[NSData alloc]initWithBytes:tkselectData length:size];

            NSString *question = [NSString stringWithUTF8String:question_c];
            NSString *trueanswer = [NSString stringWithUTF8String:trueanswer_c];
            NSString *userAnswer = [NSString stringWithUTF8String:userAnswer_c];
            NSArray* tkselect=[NSKeyedUnarchiver unarchiveObjectWithData:data];

            [mutDictionary setObject:question forKey:@"question"];
            [mutDictionary setObject:trueanswer forKey:@"trueanswer"];
            [mutDictionary setObject:userAnswer forKey:@"userAnswer"];
            [mutDictionary setObject:tkselect forKey:@"tkselect"];
            [_qaArray addObject:mutDictionary];
            //数组存字典,字典存字符串和数组
        }
        sqlite3_finalize(result);
//      [[NSMutableDictionary alloc]initWithDictionary:@{@"question" : @"这里是问题9，这道题的答案是",@"trueanswer" : @"C", @"userAnswer" : @"3", @"tkselect" :@[@"A：选项A", @"B：选项B", @"C：选项C"]}]
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height-200);
    _scrollView.backgroundColor = [UIColor orangeColor];
    _scrollView.delegate=self;
    [self scrollviewInit];
    
    _pageControl.center=CGPointMake(SCREEN_SIZE.width/2, SCREEN_SIZE.height-170);
    _pageControl.numberOfPages = 10;//指定页面个数
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(currentPageChanged:event:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnleft=[[UIButton alloc]initWithFrame:CGRectMake(50, 580, 100, 35)];
    btnleft.backgroundColor=[UIColor blueColor];
    [btnleft setTitle:@"上一题" forState:UIControlStateNormal];
    [btnleft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnleft addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
    btnleft.tag=0;
    [self.view addSubview:btnleft];
    UIButton* btnright=[[UIButton alloc]initWithFrame:CGRectMake(250, 580, 100, 35)];
    btnright.backgroundColor=[UIColor blueColor];
    [btnright setTitle:@"下一题" forState:UIControlStateNormal];
    [btnright setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnright addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
    btnright.tag=1;
    [self.view addSubview:btnright];
    //_btn.enabled=NO;
    [_btn setTitle:@"确认" forState:UIControlStateNormal];
    [_btn setBackgroundColor:[UIColor blueColor]];
    [_btn addTarget:self action:@selector(comfirm) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
}
-(void)scrollviewInit{
    CGRect rtContent = _scrollView.frame;
    rtContent.size.width = rtContent.size.width * viewCount;
    _scrollView.contentSize = rtContent.size;//滚动范围
    _scrollView.pagingEnabled = YES;//整页翻动
    _scrollView.scrollEnabled = NO;
    _scrollView.bounces=NO;//边界回弹
    [_scrollView setShowsHorizontalScrollIndicator:NO];//隐藏横向滚动条
    //设置初始的三个view
    for (int i=0; i<viewCount; i++) {
        MyTestView *view = [self setupView:nil toPage:i];
        CGRect rect = _scrollView.frame;
        rect.origin.x = rect.size.width * i;//设置view的坐标
        view.frame = rect;
        [_viewArray addObject:view];
        //if (i == 0) {
            view.backgroundColor = [UIColor whiteColor];
        //}else if(i == 1){
        //    view.backgroundColor = [UIColor yellowColor];
        //}else{
        //    view.backgroundColor = [UIColor blueColor];
        //}
        [_scrollView addSubview:view];
    }
}
//通过按钮来切换题目
-(void)pageChange:(UIButton*)btn{
    if((_pageControl.currentPage==_pageControl.numberOfPages - 1 && btn.tag==1)||(_pageControl.currentPage==0 && btn.tag==0))
        return;
    UIView *currentView = nil;
    NSUInteger maxPage = _pageControl.numberOfPages - 1;
    if (_pageControl.currentPage == 0) {
        currentView = _viewArray[0];
    }else if (_pageControl.currentPage == maxPage){
        currentView = _viewArray[2];
    }else{
        currentView = _viewArray[1];
    }
    
    NSInteger toPage = _pageControl.currentPage;
    if (btn.tag > 0) {
        toPage++;
    }else{
        toPage--;
    }
    
    NSLog(@"Page %ld => Page %ld", _pageControl.currentPage, toPage);
    // 如果是 第0页<=>第1页 或者 最后一页<=>倒数第二页，则仅更新currentPage
    if (_pageControl.currentPage == 0 || toPage == 0 || _pageControl.currentPage == maxPage || toPage == maxPage) {
        CGPoint contentOffset={0,0};
        if (toPage == 0) {
            contentOffset = ((MyTestView*)_viewArray[0]).frame.origin;
        }
        else if (toPage == maxPage){
            contentOffset = ((MyTestView*)_viewArray[2]).frame.origin;
        }
        else {
            contentOffset = ((MyTestView*)_viewArray[1]).frame.origin;
        }
        _scrollView.contentOffset = contentOffset;
        _pageControl.currentPage = toPage;
    }else{
        if (toPage > _pageControl.currentPage) {
            MyTestView *view = _viewArray[0];
            _viewArray[0] = _viewArray[1];
            _viewArray[1] = _viewArray[2];
            _viewArray[2] = view;
            [self setupView:_viewArray[2] toPage:toPage + 1];
        }else{
            MyTestView *view = _viewArray[2];
            _viewArray[2] = _viewArray[1];
            _viewArray[1] = _viewArray[0];
            _viewArray[0] = view;
            [self setupView:_viewArray[0] toPage:toPage - 1];
        }
        _pageControl.currentPage = toPage;
        
        for (int i=0; i<viewCount; i++) {
            MyTestView *view = _viewArray[i];
            CGRect rect = _scrollView.frame;
            rect.origin.x = rect.size.width * i;
            view.frame = rect;
        }
        CGPoint contentOffset = ((MyTestView*)_viewArray[1]).frame.origin;
        _scrollView.contentOffset = contentOffset;
    }
}
 //根据页码来设置view
 -(MyTestView*)setupView:(MyTestView *)view toPage:(NSUInteger)toPage
 {
     if (view == nil) {
         view = [[MyTestView alloc]init];
         view.qaArray=_qaArray;
         view.confirmBtn=_btn;
     }
     view.page=toPage;
     view.question.text = _qaArray[toPage][@"question"];
     //选项文字
     [view.RadioButton1 setTitle:_qaArray[toPage][@"tkselect"][0] forState:UIControlStateNormal];
     [view.RadioButton2 setTitle:_qaArray[toPage][@"tkselect"][1] forState:UIControlStateNormal];
     [view.RadioButton3 setTitle:_qaArray[toPage][@"tkselect"][2] forState:UIControlStateNormal];
     //选项是否选中
     if ([_qaArray[toPage][@"userAnswer"] isEqualToString:@"A"]) {
         [view.RadioButton1 setSelected:YES];
     }
     else if ([_qaArray[toPage][@"userAnswer"] isEqualToString:@"B"]) {
         [view.RadioButton2 setSelected:YES];
     }
     else if ([_qaArray[toPage][@"userAnswer"] isEqualToString:@"C"]) {
         [view.RadioButton3 setSelected:YES];
     }
     else {
         [view.RadioButton1 setSelected:NO];
         [view.RadioButton2 setSelected:NO];
         [view.RadioButton3 setSelected:NO];
     }
     return view;
 }
//批改
-(void)comfirm{
    NSInteger i=0;
    for (NSDictionary* dict in _qaArray) {
        if( [dict[@"userAnswer"] isEqualToString:@"3"] ){
            [self showMessage:@"请先完成题目!"];
            return;
        }
        if([dict[@"trueanswer"] containsString:dict[@"userAnswer"]])
            i++;
    }
    [self showMessage:[NSString stringWithFormat:@"答对了%ld道题",i]];
}
//点小白点切换界面
-(void)currentPageChanged:(UIPageControl *)pageController event:(UIEvent *)touchs{
    //根据点击位置计算需要跳到哪一个界面
    UITouch *touch = [[touchs allTouches] anyObject];
    CGPoint p = [touch locationInView:self.view];
    CGFloat centerX = pageController.center.x;
    CGFloat left = centerX-15.0*_pageControl.numberOfPages/2;
    [_pageControl setCurrentPage:(int)(p.x-left)/15];
    //根据跳跃的位置对界面重新布局
    CGPoint contentOffset={0,0};
    NSInteger toPage=_pageControl.currentPage;
    if (toPage == 0) {
        [self setupView:_viewArray[0] toPage:toPage];
        [self setupView:_viewArray[1] toPage:toPage + 1];
        contentOffset = ((MyTestView*)_viewArray[0]).frame.origin;
    }
    else if (toPage == _pageControl.numberOfPages-1){
        [self setupView:_viewArray[1] toPage:toPage - 1];
        [self setupView:_viewArray[2] toPage:toPage];
        contentOffset = ((MyTestView*)_viewArray[2]).frame.origin;
    }
    else {
        [self setupView:_viewArray[0] toPage:toPage - 1];
        [self setupView:_viewArray[1] toPage:toPage];
        [self setupView:_viewArray[2] toPage:toPage + 1];
        contentOffset = ((MyTestView*)_viewArray[1]).frame.origin;
    }
    _scrollView.contentOffset = contentOffset;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//弹窗
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    UIView *currentView = nil;
//    NSUInteger maxPage = _pageControl.numberOfPages - 1;
//    if (_pageControl.currentPage == 0) {
//        currentView = _viewArray[0];
//    }else if (_pageControl.currentPage == maxPage){
//        currentView = _viewArray[2];
//    }else{
//        currentView = _viewArray[1];
//    }
//
//    CGFloat offsetDiff = _scrollView.contentOffset.x - currentView.frame.origin.x;
//    // 如果滑动幅度没有达到翻页，则不执行reusable策略
//    if (fabs(offsetDiff) < _scrollView.frame.size.width) {
//        //        NSLog(@"不执行reusable策略：未达到翻页X(%d - %d)", (int)self.contentOffset.x, (int)currentView.frame.origin.x);
//        return;
//    }
//
//    NSInteger toPage = _pageControl.currentPage;
//    if (offsetDiff > 0) {
//        toPage++;
//    }else{
//        toPage--;
//    }
//
//    NSLog(@"Page %ld => Page %ld", _pageControl.currentPage, toPage);
//    // 如果是 第0页<=>第1页 或者 最后一页<=>倒数第二页，则仅更新currentPage
//    if (_pageControl.currentPage == 0 || toPage == 0 || _pageControl.currentPage == maxPage || toPage == maxPage) {
//        _pageControl.currentPage = toPage;
//    }else{
//        if (toPage > _pageControl.currentPage) {
//            MyView *view = _viewArray[0];
//            _viewArray[0] = _viewArray[1];
//            _viewArray[1] = _viewArray[2];
//            _viewArray[2] = view;
//            [self setupView:_viewArray[2] toPage:toPage + 1];
//        }else{
//            MyView *view = _viewArray[2];
//            _viewArray[2] = _viewArray[1];
//            _viewArray[1] = _viewArray[0];
//            _viewArray[0] = view;
//            [self setupView:_viewArray[0] toPage:toPage - 1];
//        }
//        _pageControl.currentPage = toPage;
//
//        for (int i=0; i<viewCount; i++) {
//            MyView *view = _viewArray[i];
//            CGRect rect = _scrollView.frame;
//            rect.origin.x = rect.size.width * i;
//            view.frame = rect;
//        }
//        CGPoint contentOffset = ((MyView*)_viewArray[1]).frame.origin;
//        _scrollView.contentOffset = contentOffset;
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
