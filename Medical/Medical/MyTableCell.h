

#import <UIKit/UIKit.h>


@interface MyTableCell : UITableViewCell {
	NSMutableArray *columns;
}

-(void) addColumn:(CGFloat)position;

@end
