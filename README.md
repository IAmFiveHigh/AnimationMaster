# AnimationMaster
kCAMediaTimingFunctionLinear 线性动画
kCAMediaTimingFunctionEaseIn 先慢后快（慢进快出）
kCAMediaTimingFunctionEaseOut 先块后慢（快进慢出）
kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
kCAMediaTimingFunctionDefault 默认，也属于中间比较快
------------------------------------------
kCATransitionFade 渐变效果
kCATransitionMoveIn 进入覆盖效果
kCATransitionPush 推出效果
kCATransitionReveal 揭露离开效果 subtype : 过渡动画的动画方向
kCATransitionFromRight 从右侧进入
kCATransitionFromLeft 从左侧进入
kCATransitionFromTop 从顶部进入
kCATransitionFromBottom 从底部进入
------------------------------------------
kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
kCAFillModeBackwards 在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态

