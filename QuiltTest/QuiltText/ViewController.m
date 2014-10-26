//
//  ViewController.m
//  QuiltText
//
//  Created by zhaoqihao on 10/25/14.
//  Copyright (c) 2014 com.zhaoqihao. All rights reserved.
//

#import "ViewController.h"
#import "QuiltPhotoCell.h"

const NSInteger kNumberOfCells = 200;

@interface ViewController()

@property (nonatomic,strong)NSArray *images;

@end

@implementation ViewController
@synthesize images=_images;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.quiltView.backgroundColor=[UIColor blackColor];
}

#pragma mark quiltViewController data source

-(NSArray *)images
{
    if (!_images) {
        NSMutableArray *imageNames = [NSMutableArray array];
        for(int i = 0; i < kNumberOfCells; i++) {
            [imageNames addObject:[NSString stringWithFormat:@"%d.jpeg", i % 10 + 1]];
        }
        _images = [imageNames copy];
    }
    return _images;
}

- (UIImage *)imageAtIndexPath:(NSIndexPath *)indexPath {
    return [UIImage imageNamed:[self.images objectAtIndex:indexPath.row]];
}

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView {
    return [self.images count];
}

- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath *)indexPath {
    QuiltPhotoCell *cell = (QuiltPhotoCell *)[quiltView dequeueReusableCellWithReuseIdentifier:@"PhotoCell"];
    if (!cell) {
        cell = [[QuiltPhotoCell alloc] initWithReuseIdentifier:@"PhotoCell"];
    }
    
    cell.photoView.image = [self imageAtIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row + 1];
    return cell;
}

#pragma mark - TMQuiltViewDelegate

- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView {
    
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft
        || [[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        return 3;
    } else {
        return 2;
    }
}

- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath {
    return [self imageAtIndexPath:indexPath].size.height / [self quiltViewNumberOfColumns:quiltView];
}

- (void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath
{
    QuiltPhotoCell *cell=(QuiltPhotoCell *)[quiltView cellAtIndexPath:indexPath];
    NSLog(@"%@",cell.titleLabel.text);
}


@end
