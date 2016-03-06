//
//  AppDelegate.swift
//  AnimationTabBarItemsDemo
//
//  Created by 刘光军 on 16/3/5.
//  Copyright © 2016年 刘光军. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = UIColor.whiteColor()
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.translucent = false
        
        //接收引导页"立即体验"按钮点击事件的通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadHomeViewController", name: "GuideViewControllerDidFinish", object: nil)
        
        
        createKeyWindow()
        return true
    }
    
    private func createKeyWindow() {
        
        window = UIWindow(frame: ScreenBounds)
        window?.makeKeyAndVisible()
        
        //判断是否是第一次开启应用
        let isFirstOpen = NSUserDefaults.standardUserDefaults().objectForKey("First")
        if isFirstOpen == nil {
            //第一次打开应用
            window?.rootViewController = GuideViewController()
            
            NSUserDefaults.standardUserDefaults().setObject("First", forKey: "First")
        } else {
            //不是第一次打开应用
            loadHomeViewController()
        }
    }
    
    
    
    func loadHomeViewController() {
        window?.rootViewController = MainTabBarController()
        
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
