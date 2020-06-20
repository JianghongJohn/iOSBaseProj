# iOSBaseProj
iOS基础框架
1.利用Xcode新建项目，统一使用mainProj
2.进入项目文件夹，pod init 创建cocoaPods文件，并添加环境管理脚本
  #环境宏定义
  #JHArchiveDebug
  #JHArchiveRelease
  #JHArchiveDev
  #JHArchiveDemo
  #JHArchivePre
  #JHArchiveTest
  #JHArchiveProd
  #JHArchiveAppStore
  #JHArchiveInHouse
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = '$(inherited) JHArchiveDebug=1 COCOAPODS=1'
          end
      end
  end

在pod install 后每个pod添加的工程就会加上GCC_PREPROCESSOR_DEFINITIONS

3.Xcode工程中添加环境管理的configurations


这里添加的环境有
Debug环境，开发使用后端本地调式
dev开发环境，开发内网环境
test质保测试，开发环境的测试
prod内测，正式环境的测试
pre内部测试，预发环境正式环境测试
demo演示，demo演示版本
InHouse生产环境，企业版打包
Appstore，正式AppStore发布版本

4.根据每个configurations版本配置，独立配置包名，app名称，图标，等参数
添加preprocessor macros全局宏定义
相应的就要创建各个环境所需的AppID，推送证书，App图标等

特殊的appstore版本的话，新建一个InfoAppStore.plist文件，在发布AppStore版本的时候特殊处理下版本号
5.切换环境：
    1.这时候如果配置从Jenkins打包，我这里配置的是使用Git的不同分支区分环境，如在demo环境下，podfile文件使用JHArchiveDemo=1，xcode工程的configurations使用demo环境for command-line builds这样打包出来的就是demo环境了
    2.直接使用Xcode打包，首先也是修改podfile文件,然后在edit Scheme中选择archive改为对应的环境即可
代码中就是直接使用宏定义判断版本即可
#if defined(IBArchiveDebug) || defined(IBArchiveDev) || defined(IBArchivePre)
        // 开发环境
        [GeTuiSdk startSdkWithAppId:@"rcyjHCd" appKey:@"sEmM9jIiyi" appSecret:@"qCUoCiLAEO62s" delegate:self];
    #endif
        
    #if defined(IBArchiveDemo) || defined(IBArchiveTest) || defined(IBArchiveInHouse)
        // 企业证书发布（开发环境）
        [GeTuiSdk startSdkWithAppId:@"rcyjHCdaTNALA2u" appKey:@"sEmM9jIiyi7RaY5" appSecret:@"qCUoCiLAEO628" delegate:self];
    #endif
        
    #if defined(IBArchiveProd) || defined(IBArchiveRelease) || defined(IBArchiveAppStore)
        // 生产环境
        [GeTuiSdk startSdkWithAppId:@"IdWcI0d3kk7En" appKey:@"QPCIisEKci9Aq8" appSecret:@"2xnPvNJ38J8Bc" delegate:self];
    #endif
6.开发必须的一些工具
    0.网络
JHNetWorking：封装afnetworking
    1.httpmock
JHHttpMock：使用GYHttpMock框架
    2.推送处理
    3.路由管理
    4.更新管理
    5.新手引导
