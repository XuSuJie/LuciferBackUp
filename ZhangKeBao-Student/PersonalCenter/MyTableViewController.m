//
//  MyTableViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/30.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (strong, nonatomic) NSArray *titlesArray;
@end

@implementation MyTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.titlesArray = @[@"我的角色形象",@"测评报告",@"错题收藏",@"能力变化曲线表",@"VIP会员",@"直击高考"];
        _animation=[CATransition animation];
        _animation.duration=0.35;
        _animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _animation.type=kCATransitionPush;
        _animation.subtype=kCATransitionFromRight;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
//设定节数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//一节的cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.titlesArray.count;根据数组元素的数量来确定cell的数量
    return 6;
}
//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //cell.imageView.image=[UIImage imageNamed:@""];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.text = self.titlesArray[indexPath.row];
    return cell;
}
//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewInsideViewController* vc=[[TableViewInsideViewController alloc]init];
    vc.title=self.titlesArray[indexPath.row];
    [self.view.window.layer addAnimation:_animation forKey:nil];
    [self presentViewController:vc animated:NO completion:nil];
//    MainViewController* mainViewC=[[MainViewController alloc]init];
//    mainViewC.rootViewController = navi;
//    [mainViewC setupWithType:indexPath.row];
//    navi.title=self.titlesArray[indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
