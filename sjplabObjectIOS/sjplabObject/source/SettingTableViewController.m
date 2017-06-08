#import "SettingTableViewController.h"
#import "main_header.h"

@interface SettingTableViewController(){
    NSDictionary *items;
    NSArray *itemsSectionTitles;
    
    NSInteger display_optionNo, processing_optionNo, inputType_optionNo, orgFPS_optionNo;
    NSInteger trackingALG_keyPoints, trackingALG_learning;
}

@end

@implementation SettingTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    //set config
    if(trackingALG_keyPoints == 0 && trackingALG_learning == 0){
        trackingALG_keyPoints = 1; trackingALG_learning = 1;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:display_optionNo forKey:cdisplay_optionNo];
    [[NSUserDefaults standardUserDefaults] setInteger:processing_optionNo forKey:cprocessing_optionNo];
    [[NSUserDefaults standardUserDefaults] setInteger:trackingALG_keyPoints forKey:ctrackingALG_keyPoints];
    [[NSUserDefaults standardUserDefaults] setInteger:trackingALG_learning forKey:ctrackingALG_learning];
    [[NSUserDefaults standardUserDefaults] setInteger:inputType_optionNo forKey:cinputType_optionNo];
    [[NSUserDefaults standardUserDefaults] setInteger:orgFPS_optionNo forKey:corgFPS_optionNo];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    //end set default config
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    items = @{@"display 해상도" : @[@"352*288", @"640*480", @"1280*720", @"1920*1080", @"3840*2160"],
              @"processing 해상도" : @[@"320*240", @"352*288", @"640*480", @"960*540", @"1280*720"],
              @"tracking 알고리즘" : @[@"keyPoints", @"learning"],
              @"input type" : @[@"cam front", @"cam back", @"wifi"],
              @"원천영상 FPS" : @[@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19", @"20", @"25", @"30"]};
    
//    itemsSectionTitles = [[items allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//    itemsSectionTitles = [items allKeys];
    itemsSectionTitles = @[@"display 해상도", @"processing 해상도", @"tracking 알고리즘", @"input type", @"원천영상 FPS"];
    
    //get default config
    display_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cdisplay_optionNo];
    processing_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cprocessing_optionNo];
    trackingALG_keyPoints = [[NSUserDefaults standardUserDefaults] integerForKey:ctrackingALG_keyPoints];
    trackingALG_learning = [[NSUserDefaults standardUserDefaults] integerForKey:ctrackingALG_learning];
    inputType_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:cinputType_optionNo];
    orgFPS_optionNo = [[NSUserDefaults standardUserDefaults] integerForKey:corgFPS_optionNo];
    //end get default config
    
    [self.delegate hideMainButton:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [itemsSectionTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [itemsSectionTitles objectAtIndex:section];
    NSArray *sectionItems = [items objectForKey:sectionTitle];
    return [sectionItems count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [itemsSectionTitles objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    // Configure the cell...
    NSString *sectionTitle = [itemsSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionItemss = [items objectForKey:sectionTitle];
    NSString *item = [sectionItemss objectAtIndex:indexPath.row];
    
    UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 140, 20)];
    [labelOne setBackgroundColor:[UIColor clearColor]];
    [labelOne setTextColor:[UIColor colorWithRed:5/255.f green:5/255.f blue:5/255.f alpha:1]];
    NSString *textString = [[NSString alloc] init];
    textString = @"\u2001  "; // blank unicode char to represent uncheck
    
    NSInteger optionNo = [self getOptionNo:indexPath.section];
    
    NSLog(@"cellForRowAtIndexPath section %ld : optionNo %ld", (long)indexPath.section, optionNo);
    
    if(optionNo == 77){ //trackingALG
        if(indexPath.row == 0){ //keyPoints
            if(trackingALG_keyPoints){
                textString = @"\u2713  "; // check unicode char
                [labelOne setTextColor:[UIColor colorWithRed:35/255.f green:150/255.f blue:200/255.f alpha:1]];
            }
        }else{                  //learning
            if(trackingALG_learning){
                textString = @"\u2713  "; // check unicode char
                [labelOne setTextColor:[UIColor colorWithRed:35/255.f green:150/255.f blue:200/255.f alpha:1]];
            }
        }
    }else{
        if (indexPath.row == optionNo) {
            textString = @"\u2713  "; // check unicode char
            [labelOne setTextColor:[UIColor colorWithRed:35/255.f green:150/255.f blue:200/255.f alpha:1]];
        }
    }
    
    
    
    textString = [textString stringByAppendingString:item];
    
    labelOne.textAlignment = UITextAlignmentLeft;
    labelOne.text = textString;
    [cell.contentView addSubview:labelOne];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self settOptionNo:indexPath.section value:indexPath.row];
    //[self.delegate didSelectTableRow:indexPath.row session:indexPath.section];
    //[self saveOptionValue:indexPath.section value:indexPath.row];
    [tableView reloadData];
    
}

#pragma mark - public function

- (void)saveOptionValue:(NSInteger)section value:(NSInteger)value
{
    
}

- (NSInteger)getOptionNo:(NSInteger)section
{
    switch (section) {
        case 0:
            return display_optionNo;
            break;
        case 1:
            return processing_optionNo;
            break;
        case 2:   //tracking 알고리즘
            return 77;
            break;
        case 3:
            return inputType_optionNo;
            break;
        case 4:
            return orgFPS_optionNo;
            break;
        default:
            return display_optionNo;
            break;
    }
}

- (void)settOptionNo:(NSInteger)section value:(NSInteger)value
{
    switch (section) {
        case 0:
            display_optionNo = value;
            break;
        case 1:
            processing_optionNo = value;
            break;
        case 2: //trackingALG
            if(value == 0){ //keypoints
                trackingALG_keyPoints = trackingALG_keyPoints?0:1;
            }else{          //learning
                trackingALG_learning = trackingALG_learning?0:1;
            }
            break;
        case 3:
            inputType_optionNo = value;
            break;
        case 4:
            orgFPS_optionNo = value;
            break;
        default:
            display_optionNo = value;
            break;
    }
}


@end
