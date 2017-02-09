//
//  SettingTableViewController.h
//  sjplabObject
//
//  Created by gclee on 2016. 10. 18..
//

#import <UIKit/UIKit.h>

@protocol SettingTableViewDelegate;

@interface SettingTableViewController : UITableViewController

@property (nonatomic, weak) id<SettingTableViewDelegate> delegate;

@end

@protocol SettingTableViewDelegate <NSObject>
@optional
- (void)didSelectTableRow:(int)optionNo session:(int)session;
-(void)hideMainButton:(NSInteger)hide;
@end
