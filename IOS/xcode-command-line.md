https://developer.apple.com/library/ios/technotes/tn2339/_index.html





http://apple.stackexchange.com/questions/88535/how-to-download-the-command-line-tools-for-xcode-without-the-downloads-for-devel

http://railsapps.github.io/xcode-command-line-tools.html

https://coderwall.com/p/dhnceq/modifying-xcode-projects-via-command-line

As part of the iOS developer tasks, I have to create plugins for Unity3d to interact with native libraries. So far, so good. But what happen if you want to modify programmatically, via scripts, or command line the XCode's project to automatically add dependencies and files?
Short answer: good luck with that, the format is not documented at all. It's a big black box. 
Fortunately, one fella (https://bitbucket.org/darktable) made part of the work creating a python script to modify XCode's project files.
But there is small hiccup with this script, it doesn't write the latest XCode format, so Unity3d won't be able of update the project if something has changed.
Therefore, i just decided to fork the project (https://github.com/kronenthaler/mod-pbxproj) and extended it to write the right format and give it back to the community, so XCode, Unity3d and the developers may live in peace.

may the fork be with you.


https://github.com/0xced/xcproj

https://bottleofcode.com/2014/08/11/adding-files-to-xcode-projects-from-command-line/

http://stackoverflow.com/questions/26518592/add-files-to-xcode-project-through-command-line-use-of-project-pbxproj-file-in

http://codingfingers.com/index.html%3Fp=11065.html

http://dduan.net/post/2015/02/build-and-run-ios-apps-in-commmand-line/

http://stackoverflow.com/questions/24011120/how-can-i-use-swift-in-terminal

http://jamesonquave.com/blog/running-swift-scripts-from-the-command-line/

http://crunchybagel.com/building-command-line-tools-with-swift/

# objective C

http://stackoverflow.com/questions/24002369/how-to-call-objective-c-code-from-swift

https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html


