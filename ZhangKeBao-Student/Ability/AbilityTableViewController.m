//
//  AbilityTableViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/30.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "AbilityTableViewController.h"

@interface AbilityTableViewController ()
@property (strong, nonatomic) NSArray *titlesArray;
@property(strong,nonatomic) NSArray* colorsArray;
@end

@implementation AbilityTableViewController

- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        //cell风格
        self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        //根据约束自动计算行高度
        self.tableView.rowHeight=UITableViewAutomaticDimension;
        //设置估算高度
        self.tableView.estimatedRowHeight=400;
        self.tableView.dataSource=self;
        self.tableView.delegate=self;
        self.titlesArray = @[@"霍兰德兴趣测评",@"职业性格测评",@"能力测评",@"职业性格测评2",@"能力测评2"];
        self.colorsArray=@[[UIColor orangeColor],[UIColor colorWithRed:65.0/255 green:129.0/255 blue:226.0/255 alpha:1],[UIColor colorWithRed:142.0/255 green:115.0/255 blue:212.0/255 alpha:1],[UIColor colorWithRed:65.0/255 green:129.0/255 blue:226.0/255 alpha:1],[UIColor colorWithRed:142.0/255 green:115.0/255 blue:212.0/255 alpha:1]];
//        _animation=[CATransition animation];
//        _animation.duration=0.35;
//        _animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        _animation.type=kCATransitionPush;
//        _animation.subtype=kCATransitionFromRight;
        //[self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"cell"];
        //自定义cell xib
        [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil]  forCellReuseIdentifier:@"cell"];
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
    return 5;
}
//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    //cell.imageView.image=[UIImage imageNamed:@""];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    //cell.textLabel.text = self.titlesArray[indexPath.row];
    cell.backgroundColor=self.colorsArray[indexPath.row];
    cell.label1.text=self.titlesArray[indexPath.row];
    cell.label2.text=@"完成情况";
    switch (indexPath.row) {
        case 0:
            cell.label3.text=@"发现你的潜在兴趣.................................................................";
            break;
        case 1:
            cell.label3.text=@"发现你天生的职业倾向..........................................................................................";
            break;
        case 2:
            cell.label3.text=@"发现你的潜在能力.........................................................................................................................................................................................";
            break;
        case 3:
            cell.label3.text=@"发现你天生的职业倾向..........................................................................................天生的职业倾向..........................................................................................";
            break;
        case 4:
            cell.label3.text=@"发现你的潜在能力......................................发现你的潜在能力......................................发现你的潜在能力......................................发现你的潜在能力......................................发现你的潜在能力......................................发现你的潜在能力......................................";
            break;
    }
    
    return cell;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AbilityTestViewController* vc=[[AbilityTestViewController alloc]init];
    vc.navigationItem.title=self.titlesArray[indexPath.row];
    //[self.view.window.layer addAnimation:_animation forKey:nil];
    //[self presentViewController:vc animated:NO completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
