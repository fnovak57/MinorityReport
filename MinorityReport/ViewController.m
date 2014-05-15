//
//  ViewController.m
//  MinorityReport
//
//  Created by frank.novak on 5/15/14.
//  Copyright (c) 2014 PHMobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *thePreCogsLabel;
@property CGAffineTransform transform;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transform = self.theFutureLabel.transform;

}

-(IBAction)onDrag:(UIPanGestureRecognizer *) panGestureRecognizer
{
    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{self.theFutureLabel.transform = self.transform;
        }];
    }

    else
    {

        NSLog(@"Pan This");
        CGPoint point;
        point = [panGestureRecognizer translationInView:self.view];
        self.theFutureLabel.transform = CGAffineTransformMakeTranslation(point.x,point.y);
        point.x += self.theFutureLabel.center.x;
        point.y += self.theFutureLabel.center.y;

        if(CGRectContainsPoint(self.thePreCogsLabel.frame, point))
        {
            self.theFutureLabel.text = @"A ficticious and incriminating future";
            self.theFutureLabel.backgroundColor = [UIColor orangeColor];
            [self.theFutureLabel sizeToFit];
        }


    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
