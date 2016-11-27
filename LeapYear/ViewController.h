//
//  ViewController.h
//  LeapYear
//
//  Created by Marco Almeida on 11/27/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NumSetDelegate
- (void) numValueWasChosen:(NSInteger)numValue;
@end

//@property (nonatomic) id<NumSetDelegate> delegate;
//id is a bucket or container where you can place anything <> means a filter the object placed inside the id bucket must conform

@interface ViewController : UIViewController


@end

