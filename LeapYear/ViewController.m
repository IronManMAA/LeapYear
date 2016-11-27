//
//  ViewController.m
//  LeapYear
//
//  Created by Marco Almeida on 11/27/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *DisplayFrame;
@property (strong, nonatomic) IBOutlet UITextField *YearTextField;

// IBOutlet is used to change the attributes of the label object e.g. size, color, location, etc.
// IBAction is used to define actions or handle content. We use methods for this.
@property (assign) NSString *DisplayText;
@property (assign) NSString *strvalYear;
@property (assign) NSString *strvalMonths;
@property (assign) NSString *strvalDays;
@property (assign) NSString *strvalHours;
@property (assign) NSString *strvalSecs;
@property (assign) long givenYear;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
self.DisplayFrame.text=@"";
self.YearTextField.text=@"";
self.strvalYear=@"";
self.strvalMonths=@"";
self.strvalDays=@"";
self.strvalHours=@"";
self.strvalSecs=@"";
self.givenYear=0;
//self.secondsInAYear =65*24*60;
//self.hoursInAYear =365*24;
//self.daysInAYear =365;
//self.monthsInAYear =12;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action  Handlers

//Display seconds in chosen year

- (IBAction)BYear:(UIButton *)sender {

    
    self.givenYear  = [self.YearTextField.text integerValue];
if (self.givenYear<1 || self.givenYear>9999)
{
    self.DisplayFrame.text = @"Invalid Year. Please enter a valid 4 digit year.";
    return;
}
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
//    [components setWeekday:2]; // Monday
//    [components setWeekdayOrdinal:1]; // The first Monday in the month
    [components setDay:31];
    [components setMonth:12]; // Dezember
    [components setYear:[self.YearTextField.text integerValue]];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [gregorian dateFromComponents:components];
    self.givenYear=0;
    self.DisplayFrame.text=@"";
    NSUInteger dayOfYear = [gregorian ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate: date];
//    self.YearTextField.text = [NSString stringWithFormat:@"%li days", dayOfYear];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ResultText" ofType:@"txt"];
    NSString *str=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    //    NSString *str = @"This is a string";
   if (dayOfYear >365)
   {
    self.strvalYear=self.YearTextField.text;
    self.strvalSecs=@"527,040";
    self.strvalHours=@"8,784";
    self.strvalDays=@"366";
    self.strvalMonths=@"12";
    str = [str stringByReplacingOccurrencesOfString:@"%@L" withString: @"a Leap year"];
   } else {
    self.strvalYear=self.YearTextField.text;
    self.strvalSecs=@"525,600";
    self.strvalHours=@"8,760";
    self.strvalDays=@"365";
    self.strvalMonths=@"12";
    str = [str stringByReplacingOccurrencesOfString:@"%@L" withString: @"not a Leap year"];
   }
    str = [str stringByReplacingOccurrencesOfString:@"%@Y" withString: self.strvalYear];
    str = [str stringByReplacingOccurrencesOfString:@"%@S" withString: self.strvalSecs];
    str = [str stringByReplacingOccurrencesOfString:@"%@H" withString: self.strvalHours];
    str = [str stringByReplacingOccurrencesOfString:@"%@D" withString: self.strvalDays];
    str = [str stringByReplacingOccurrencesOfString:@"%@M" withString: self.strvalMonths];
    self.DisplayFrame.text = str;
}

@end
