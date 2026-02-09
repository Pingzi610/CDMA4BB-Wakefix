这东西其实就是我研究3GS降级基带过程的副产物。
原理如下：删掉/System/Library/LaunchDaemons/com.apple.CommCenter.plist，并将我提供的plist放入/Library/LaunchDaemons里面，然后把BBUpdaterExtreme放到/usr/bin，把.sh脚本放到/usr/games
脚本会开机自启，不断尝试启动BBUpdaterExtreme的防止重启机制，一旦防重启机制启动，立刻结束BBUpdaterExtreme进程。
这个方法会导致用量、蜂窝移动网络等打不开，且电话app会出现一个红点。目前我的能力没办法解决这些。正如我所述，这个方法非常的草台班子。

This little hack’s actually a byproduct of my research into the baseband downgrade process for the iPhone 3GS.
Here’s how it works: Delete /System/Library/LaunchDaemons/com.apple.CommCenter.plist, then place the plist file I provide into /Library/LaunchDaemons. After that, put BBUpdaterExtreme into /usr/bin, and the .sh script into /usr/games.
The script launches on boot and repeatedly attempts to activate BBUpdaterExtreme’s anti-reboot mechanism. Once the anti-reboot mechanism is up and running, it immediately terminates the BBUpdaterExtreme process.
This method will break access to the Usage and Cellular Data menus, and a red badge will show up on the Phone app. I currently don’t have the know-how to fix these issues. As I said, this is an extremely janky makeshift solution.
