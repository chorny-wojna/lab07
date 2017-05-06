//
//  ViewController.m
//  lab07_TP
//
//  Created by fpmi on 28.04.17.
//  Copyright (c) 2017 Raman Baranaw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *Canvas;
@property (nonatomic) CGPoint lastPoint;
@property (strong, nonatomic) IBOutlet UILabel *lineWidth;
@property (strong, nonatomic) IBOutlet UITextField *lineWidthField;
@property CGFloat lineWidthVal;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UITextField *colorRedField;
@property (weak, nonatomic) IBOutlet UITextField *colorGreenField;
@property (weak, nonatomic) IBOutlet UITextField *colorBlueField;
@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;
@property (weak, nonatomic) IBOutlet UILabel *saveLabel;
@property (weak, nonatomic) IBOutlet UITextField *fileField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.Canvas]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.Canvas];
    UIGraphicsBeginImageContext(self.Canvas.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.Canvas.frame.size.width, self.Canvas.frame.size.height);
    [[[self Canvas] image] drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.lineWidthVal);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green, self.blue, 1.0f);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x,                                                                                                                                                                                                                                                                                                                                            _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(),  currentPoint.x, currentPoint.y);
   
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [[self Canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()]; UIGraphicsEndImageContext();
    _lastPoint = currentPoint;
    
    
    
}

- (IBAction)saveImage:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    UIImage *imageToSave = [[self Canvas] image];
    NSData *binaryImageData = UIImagePNGRepresentation(imageToSave);
    
    [binaryImageData writeToFile:[basePath stringByAppendingPathComponent:[self.fileField text]] atomically:YES];
}



- (IBAction)setOptions:(id)sender {
    self.lineWidthVal = [self.lineWidthField.text floatValue];
    self.red = [ self.colorRedField.text floatValue];
    if (self.red > 1.f && self.red < 0.f)
    {
        self.red = 1.f;
    }
    
    self.green = [ self.colorGreenField.text floatValue];
    if (self.green > 1.f && self.green < 0.f)
    {
        self.green = 1.f;
    }
    
    self.blue =	 [ self.colorBlueField.text floatValue];
    if (self.blue > 1.f && self.blue < 0.f)
    {
        self.blue = 1.f;
    }
}

@end
