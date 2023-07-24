//
//  AgoraTranslateSettingViewController.m
//  AgoraChat-Demo
//
//  Created by li xiaoming on 2023/6/9.
//  Copyright © 2023 easemob. All rights reserved.
//

#import "AgoraTranslateSettingViewController.h"
#import "ACDTitleDetailCell.h"
#import "ACDTitleSwitchCell.h"
#import "DemandTranslateLanguageTableViewController.h"
#import "AutoTranslateLanguageTableViewController.h"

@interface AgoraTranslateSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AgoraTranslateSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"translate.setting", nil);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ACDTitleDetailCell*cell = [tableView dequeueReusableCellWithIdentifier:[ACDTitleDetailCell reuseIdentifier]];
    if (cell == nil) {
        cell = [[ACDTitleDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ACDTitleDetailCell reuseIdentifier]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    WEAK_SELF
    if (indexPath.row == 0) {
        cell.nameLabel.text = NSLocalizedString(@"demandLanguages", nil);
        cell.tapCellBlock = ^{
            [weakSelf pushDemandLanguageSettingVC];
        };
    } else {
        cell.nameLabel.text = NSLocalizedString(@"autoLanguageSetting", nil);
        
        cell.tapCellBlock = ^{
            [weakSelf pushAutoLanguageSettingVC];
        };
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)pushDemandLanguageSettingVC
{
    DemandTranslateLanguageTableViewController* demandTLVC = [[DemandTranslateLanguageTableViewController alloc] initWithNibName:@"DemandTranslateLanguageTableViewController" bundle:nil];
    [self.navigationController pushViewController:demandTLVC animated:YES];
}

- (void)pushAutoLanguageSettingVC
{
    AutoTranslateLanguageTableViewController* autoTLVC = [[AutoTranslateLanguageTableViewController alloc] initWithNibName:@"AutoTranslateLanguageTableViewController" bundle:nil];
    [self.navigationController pushViewController:autoTLVC animated:YES];
}

@end
