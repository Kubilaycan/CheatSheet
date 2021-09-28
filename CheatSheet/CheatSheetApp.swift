//
//  CheatSheetApp.swift
//  CheatSheet
//
//  Created by Kubilay on 27.09.2021.
//

import SwiftUI

@main
struct CheatSheetApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView()
        
        popover.behavior = .transient
        popover.animates = true
        
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: menuView)
        
        popover.contentViewController?.view.window?.makeKey()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        
        if let MenuButton = statusItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "applelogo", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToggle)
        }
    }
    
    @objc func MenuButtonToggle(sender: AnyObject) {
        if popover.isShown {
            popover.performClose(sender)
        }
        else {
            if let menuButton = statusItem?.button {
                self.popover.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
