//
//  DragonTableViewController.swift
//  DragonFashionSwift
//
//  Created by Susan Salas on 1/28/16.
//  Copyright © 2016 Susan Salas. All rights reserved.
//

import UIKit

class DragonTableViewController: UITableViewController {
    
    var dragonArray: [Dragon] = []
    var myIndexPath:NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        let dragon1 = Dragon(theName: "Charizard", theAccessory: "Nose ring")
        let dragon2 = Dragon(theName: "Bob the Dragon", theAccessory: "Hammer")
        let dragon3 = Dragon(theName: "Susan the SkullCrusher", theAccessory: "Skulls")
        let dragon4 = Dragon(theName: "Fabio the DragQueen", theAccessory: "Dress")
        let dragon5 = Dragon(theName: "Fabiana the DragKing", theAccessory: "Balls")
        
        dragonArray = [dragon1, dragon2, dragon3, dragon4, dragon5]
        
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dragonArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DragonCell", forIndexPath: indexPath)
        let currentDragon:Dragon = dragonArray[indexPath.row]
        
        cell.textLabel?.text = currentDragon.name
        cell.detailTextLabel?.text = currentDragon.accessory

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        myIndexPath = indexPath
        performSegueWithIdentifier("DragonSegue", sender: self)
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! DetailViewController
        let currentDragon:Dragon = dragonArray[myIndexPath!.row]
        destination.title = currentDragon.name
        

    }


}
