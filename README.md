quiltViewWithARC
================

Hello guys,I'm an ios app developer from China,some days ago, I found a TMQuiltView that can make images anomaly,just like a waterfall,very beautiful,but,it can just work on non-ARC,so I decide to make some changes to support ARC.

a quilt view based on TMQuiltView(url: https://github.com/1000Memories/TMQuiltView ),with ARC support,I changed some pointer (things like this:NSMutableArray **) to objc objects(NSMutableArray *,etc),so it can work with ARC.
 
