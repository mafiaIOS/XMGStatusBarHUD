# XMGStatusBarHUD
一款简单易用的状态栏指示器小框架
## 显示成功信息
````objc
[XMGStatusBarHUD showSuccess:@"发布成功!"];
````

##显示失败信息
````objc
[XMGStatusBarHUD showError:@"发布失败!"];
````
##正在加载中
````objc
[XMGStatusBarHUD showLoading:@"正在加载中..."];
````
##隐藏
````objc
[XMGStatusBarHUD hide];
````
##显示普通提示信息
````objc
[XMGStatusBarHUD showMessage:@"做最简单易用的HUD"];
````