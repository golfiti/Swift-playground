//: Playground - noun: a place where people can play

import UIKit


// Create View
let container = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
container.backgroundColor  = UIColor.darkGrayColor()
let view = UIView(frame: CGRect(x: 25, y: 25, width: 50.0, height: 50.0))
view.backgroundColor = UIColor.blackColor()


// Add subview
container.addSubview(view)


// Remove subview
for view in container.subviews {
    view.removeFromSuperview()
}
container


// Create UILabel
let title = UILabel(frame: CGRectMake(50, 50, 100, 20))
title.text = "My Title"
title.textColor = UIColor.whiteColor()
title.textAlignment = NSTextAlignment.Center

// Create UIButton
let button = UIButton(frame: CGRectMake(50, 100, 100, 50))
button.backgroundColor = UIColor.whiteColor()
button.setTitle("My Button", forState: UIControlState.Normal)
button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)





