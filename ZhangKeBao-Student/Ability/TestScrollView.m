//
//  TestScrollView.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/22.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "TestScrollView.h"

@interface TestScrollView ()

@end

@implementation TestScrollView
static const int viewCount = 3;
- (instancetype)init
{
    self = [super init];
    if (self) {
        _scrollView = [[UIScrollView alloc] init];
        _pageControl = [[UIPageControl alloc]init];
        _viewArray = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height-200);
    _scrollView.backgroundColor = [UIColor orangeColor];
    _scrollView.delegate=self;
    [self scrollviewInit];
    
    _pageControl.frame = CGRectMake(210, SCREEN_SIZE.height-150, 20, 20);//指定位置大小
    _pageControl.numberOfPages = 10;//指定页面个数
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
    
    //_scrollView.pagingEnabled = YES;//整页翻动
    //_scrollView.bounces=NO;//边界回弹
    //_scrollView.showsHorizontalScrollIndicator = NO; //隐藏横向滚动条
    //_scrollView.contentSize = CGSizeMake(SCREEN_SIZE.width* 3, _scrollView.frame.size.height);
    UIButton* btnleft=[[UIButton alloc]initWithFrame:CGRectMake(50, 600, 100, 40)];
    btnleft.backgroundColor=[UIColor blueColor];
    btnleft.titleLabel.text=@"上一题";
    [btnleft setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnleft addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
    btnleft.tag=0;
    [self.view addSubview:btnleft];
    UIButton* btnright=[[UIButton alloc]initWithFrame:CGRectMake(250, 600, 100, 40)];
    btnright.backgroundColor=[UIColor blueColor];
    btnright.titleLabel.text=@"下一题";
    [btnright setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnright addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventTouchUpInside];
    btnright.tag=1;
    [self.view addSubview:btnright];
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
}
-(void)scrollviewInit{
    CGRect rtContent = _scrollView.frame;
    rtContent.size.width = rtContent.size.width * viewCount;
    _scrollView.contentSize = rtContent.size;//滚动范围
    _scrollView.pagingEnabled = YES;//整页翻动
    _scrollView.bounces=NO;//边界回弹
    [_scrollView setShowsHorizontalScrollIndicator:NO];//隐藏横向滚动条
    //设置初始的三个view
    for (int i=0; i<viewCount; i++) {
        MyView *view = [self setupView:nil toPage:i];
        CGRect rect = _scrollView.frame;
        rect.origin.x = rect.size.width * i;//设置view的坐标
        view.frame = rect;
        [_viewArray addObject:view];
        if (i == 0) {
            view.backgroundColor = [UIColor redColor];
        }else if(i == 1){
            view.backgroundColor = [UIColor yellowColor];
        }else{
            view.backgroundColor = [UIColor blueColor];
        }
        [_scrollView addSubview:view];
    }
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
            contentOffset = ((MyView*)_viewArray[0]).frame.origin;
        }
        else if (toPage == maxPage){
            contentOffset = ((MyView*)_viewArray[2]).frame.origin;
        }
        else {
            contentOffset = ((MyView*)_viewArray[1]).frame.origin;
        }
        _scrollView.contentOffset = contentOffset;
        _pageControl.currentPage = toPage;
        //[_scrollView setContentOffset:CGPointMake(SCREEN_SIZE.width*(_pageControl.currentPage %3),0)];
    }else{
        if (toPage > _pageControl.currentPage) {
            MyView *view = _viewArray[0];
            _viewArray[0] = _viewArray[1];
            _viewArray[1] = _viewArray[2];
            _viewArray[2] = view;
            [self setupView:_viewArray[2] toPage:toPage + 1];
        }else{
            MyView *view = _viewArray[2];
            _viewArray[2] = _viewArray[1];
            _viewArray[1] = _viewArray[0];
            _viewArray[0] = view;
            [self setupView:_viewArray[0] toPage:toPage - 1];
        }
        _pageControl.currentPage = toPage;
        
        for (int i=0; i<viewCount; i++) {
            MyView *view = _viewArray[i];
            CGRect rect = _scrollView.frame;
            rect.origin.x = rect.size.width * i;
            view.frame = rect;
        }
        CGPoint contentOffset = ((MyView*)_viewArray[1]).frame.origin;
        _scrollView.contentOffset = contentOffset;
    }
}
 //根据页码来设置view
 -(MyView*)setupView:(MyView *)view toPage:(NSUInteger)toPage
 {
     if (view == nil) {
         view = [[MyView alloc]init];
     }
     view.label.text = [NSString stringWithFormat:@"题目%lu",(unsigned long)toPage];
     return view;
 }
-(void)pageChanged{
    NSInteger toPage=_pageControl.currentPage;
    CGPoint contentOffset={0,0};
    if (toPage == 0) {
        [self setupView:_viewArray[0] toPage:toPage];
        [self setupView:_viewArray[1] toPage:toPage + 1];
        contentOffset = ((MyView*)_viewArray[0]).frame.origin;
    }
    else if (toPage == _pageControl.numberOfPages-1){
        [self setupView:_viewArray[1] toPage:toPage - 1];
        [self setupView:_viewArray[2] toPage:toPage];
        contentOffset = ((MyView*)_viewArray[2]).frame.origin;
    }
    else {
        [self setupView:_viewArray[0] toPage:toPage - 1];
        [self setupView:_viewArray[1] toPage:toPage];
        [self setupView:_viewArray[2] toPage:toPage + 1];
        contentOffset = ((MyView*)_viewArray[1]).frame.origin;
    }
    _scrollView.contentOffset = contentOffset;
//    for (int i=0; i<viewCount; i++) {
//        MyView *view = _viewArray[i];
//        CGRect rect = _scrollView.frame;
//        rect.origin.x = rect.size.width * i;
//        view.frame = rect;
//    }
//    CGPoint contentOffset = ((MyView*)_viewArray[1]).frame.origin;
//    _scrollView.contentOffset = contentOffset;
    //[_scrollView setContentOffset:CGPointMake(SCREEN_SIZE.width*page, 0)];
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
