
#import <UIKit/UIKit.h>
#import "TMQuiltViewCell.h"
#import "TMQuiltViewController.h"

@class TMQuiltView;

typedef enum {
    TMQuiltViewCellMarginTop,
    TMQuiltViewCellMarginLeft,
    TMQuiltViewCellMarginRight,
    TMQuiltViewCellMarginBottom,
    TMQuiltViewCellMarginColumns,
    TMQuiltViewCellMarginRows
} TMQuiltViewMarginType;

@protocol TMQuiltViewDataSource <NSObject>

- (NSInteger)quiltViewNumberOfCells:(TMQuiltView *)TMQuiltView;
- (TMQuiltViewCell *)quiltView:(TMQuiltView *)quiltView cellAtIndexPath:(NSIndexPath*)indexPath;

@end

@protocol TMQuiltViewDelegate <UIScrollViewDelegate>

@optional

- (void)quiltView:(TMQuiltView *)quiltView didSelectCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)quiltViewNumberOfColumns:(TMQuiltView *)quiltView;

- (CGFloat)quiltViewMargin:(TMQuiltView *)quilView marginType:(TMQuiltViewMarginType)marginType;

- (CGFloat)quiltView:(TMQuiltView *)quiltView heightForCellAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface TMQuiltView : UIScrollView

@property (nonatomic, assign) id<TMQuiltViewDataSource> dataSource;
@property (nonatomic, assign) id<TMQuiltViewDelegate> delegate;

- (TMQuiltViewCell *)cellAtIndexPath:(NSIndexPath*)indexPath;

- (TMQuiltViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)reuseIdentifier;

- (NSArray *)visibleCells;

- (void)reloadData;

- (void)beginUpdates;
- (void)endUpdates;
- (void)insertCellAtIndexPath:(NSIndexPath *)indexPaths;
- (void)deleteCellAtIndexPath:(NSIndexPath *)indexPaths;
- (void)moveCellAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath;

- (CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)cellWidth;

- (NSInteger)numberOfCells;

- (NSInteger)numberOfColumns;

- (NSInteger)numberOfCellsInColumn:(NSInteger)column;

@end

