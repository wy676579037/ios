## Pod总结
### 常用命令

 pod install --no-repo-update 
 
 pod update --verbose --no-repo-update 
 
 pod update + 你想升级的那个库的名字 
 
 例如： pod update MJRefresh
 
 pod setup
 
 
### pod setup慢问题解决
 
 cd ~/.cocoapods/repos
 
 git clone https://github.com/CocoaPods/Specs.git
 
 这样就可以看到进度条了，等下载好之后，只需要把这个Specs 改名为master 就可以了。
 
 pod repo 
 
 找同事到.cocoapods 目录下把master文件夹考一份过来。一般情况下都可以解决。
 
### 安装pod

gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

gem sources -l

sudo gem install cocoapods

pod setup


### 重新安装
1.卸载

sudo gem uninstall cocoapods

2.重新安装

sudo gem install -n /usr/local/bin cocoapods

3.如果没有权限执行pod，执行命令一下命令赋予/usr/local/bin给予执行与读取权限

sudo chmod +rx /usr/local/bin/

### 使用podProduts下Framwork的坑
当我们通过pod进来源码进来之后，后面拷贝debug运行之后的Framework进行运行的话发现在会出现armv64 armV7之类的指令集错误,原因在于，debug运行出来的包与release运行出来的包指令集是不一样的，具体可以参考build settings里的设置，把debug时 build active Achitecture Only设置成no 

### 在多工程依赖的情况下 
Linked Frameworks and Libraries staus要选择optional，在最后集成的时候选择required，不然会出现image not found的错误




 