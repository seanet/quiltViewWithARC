
#import "TMQuiltViewCell.h"

@implementation TMQuiltViewCell

@synthesize reuseIdentifier = _reuseIdentifier;
@synthesize selected = _selected;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super init];
    if (self) {
        _reuseIdentifier = reuseIdentifier;
    }
    return self;
}

@end
