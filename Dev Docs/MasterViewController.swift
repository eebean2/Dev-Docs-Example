//
//  MasterViewController.swift
//  Dev Docs
//
//  Created by Erik Bean on 1/15/17.
//  Copyright © 2017 Red Man Apps. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var sections = ["App Frameworks", "Graphics and Games", "App Services", "Media and Web", "Developer Tools", "System", "Other"]
    let frameworks = ["AppKit", "Foundation", "Objective-C", "Swift Standard Library", "UIKit", "WatchKit"]
    let graphics = ["AGL", "Core Graphics", "Core Image", "GameController", "GameKit", "GameplayKit", "GLKit", "Image I/O", "Metal", "MetalKit", "MetalPerformanceShaders", "Model I/O", "OpenGL ES", "QuartzCore", "ReplayKit", "SceneKit", "SpriteKit"]
    let services = ["Accounts", "AddressBook", "AddressBookUI", "AdSupport", "ApplicationServices", "CallKit", "ClockKit", "CloudKit", "CloudKit JS", "Contacts", "ContactsUI", "Core Data", "Core Foundation", "Core Location", "Core Motion", "Core Spotlight", "Core Text", "EventKit", "EventKitUI", "HealthKit", "HealthKitUI", "HomeKit", "iAd", "Intents", "IntentsUI", "Mapkit", "Messages", "MessageUI", "MultipeerConnectivity", "NewsstandKit", "NotificationCenter", "PassKit", "PushKit", "QuickLook", "Social", "Speech", "StoreKit", "TVServices", "UserNotifications", "UserNotificationsUI", "WatchConnectivity"]
    let media = ["Apple Pay JS", "AssetsLibrary", "AudioToolbox", "AudioUnit", "AVFoundation", "AVKit", "Core Audio", "Core Audio Kit", "Core Media", "Core MIDI", "Core Video", "FxPlug", "iAdJS", "iAdJSBindings", "iTunesLibrary", "JavaScriptCore", "MediaAccessibility", "MediaLibrary", "MediaPlayer", "Photos", "PhotosUI", "QTKit", "Quartz", "Safari Extentions JS", "SafariServices", "ScreenSaver", "TVMLKit", "TVMLKit JS", "VideoTookbox", "Webkit", "Webkit JS"]
    let tools = ["Automator", "InstallerJS", "PlaygroundSupport", "ScriptingBridge", "XcodeKit", "XCTest"]
    let system = ["Accelerate", "CFNetwork", "Collaboration", "Compression", "Core Bluetooth", "Core Services", "Core Telephony", "CoreWLAN", "CryptoTokenKit", "DarwinNotify", "DiskArbitration", "Dispatch", "dnssd", "ExceptionHandling", "ExternalAccessory", "ForceFeedback", "FWAUserLib", "GSS", "Hypervision", "IMServicePlugIn", "InputMethodKit", "IOBluetooth", "IOBluetoothUI", "IOKit", "IOSurface", "Kernal", "LatentSemanticMapping", "LocalAutentication", "MobileCoreServices", "NetworkExtention", "OpenDirectory", "os", "Security", "SecurityFoundation", "SecurityInterface", "ServiceManagement", "ServiceConfiguration", "vmnet", "XPC"]
    let other = ["Coming Soon!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//            let object = self.fetchedResultsController.object(at: indexPath)
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
//        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:     return sections[section]
        case 1:     return sections[section]
        case 2:     return sections[section]
        case 3:     return sections[section]
        case 4:     return sections[section]
        case 5:     return sections[section]
        case 6:     return sections[section]
        default:    print("Section Count Error! Printing Frameworks Title"); return sections[0]
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:     return frameworks.count
        case 1:     return graphics.count
        case 2:     return services.count
        case 3:     return media.count
        case 4:     return tools.count
        case 5:     return system.count
        case 6:     return other.count
        default:    print("Section Count Error! Printing Frameworks Content"); return frameworks.count
        }
//        let sectionInfo = self.fetchedResultsController.sections![section]
//        return sectionInfo.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        switch indexPath.section {
        case 0:     cell.textLabel!.text = frameworks[indexPath.row]
        case 1:     cell.textLabel!.text = graphics[indexPath.row]
        case 2:     cell.textLabel!.text = services[indexPath.row]
        case 3:     cell.textLabel!.text = media[indexPath.row]
        case 4:     cell.textLabel!.text = tools[indexPath.row]
        case 5:     cell.textLabel!.text = system[indexPath.row]
        case 6:     cell.textLabel!.text = other[indexPath.row]
        default:    print("Section Count Error! Printing Frameworks Content"); cell.textLabel!.text = other[indexPath.row]
        }
        
//        let event = self.fetchedResultsController.object(at: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    /*
    // MARK: - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController<Event> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Event> = Event.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
             // Replace this implementation with code to handle the error appropriately.
             // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             let nserror = error as NSError
             fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }    
    var _fetchedResultsController: NSFetchedResultsController<Event>? = nil

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
            case .insert:
                self.tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            case .delete:
                self.tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            default:
                return
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            case .insert:
                tableView.insertRows(at: [newIndexPath!], with: .fade)
            case .delete:
                tableView.deleteRows(at: [indexPath!], with: .fade)
            case .update:
                self.configureCell(tableView.cellForRow(at: indexPath!)!, withEvent: anObject as! Event)
            case .move:
                tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }

     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         self.tableView.reloadData()
     }
     */

}

