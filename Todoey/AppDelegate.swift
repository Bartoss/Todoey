//
//  AppDelegate.swift
//  Todoey
//
//  Created by Sarata Bartlomiej on 08.03.2018.
//  Copyright © 2018 Bartłomiej Sarata. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do{
            _ = try Realm()
        }catch{
            print("Error initialising realm, \(error)")
        }
        return true
    }

}

