//
//  PizzaListTableViewController.swift
//  DKrebs_TableViewAppHW8
//
//  Created by user165127 on 3/11/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

let pizzaPlaces = [PizzaPlace(name: "Nancy's", rank: .top20, shortDesc: "Nancy's Pizza, stuffed pizza of your deams", longDesc: "Nancy's Pizza is know for their little delivery trucks all around town, and some of the best stuffed pizza you'll find in Chicago. A must try"), PizzaPlace(name: "Oven Gridner Co", rank: .top20, shortDesc: "Chicago Pizza and Over Grinder Company", longDesc: "What is an oven grinder you may ask? Basically...a pizza pot pie! The best non-traditional form of pizza you'll ever eat."), PizzaPlace(name: "Bartoli's", rank: .top20, shortDesc: "Classic Chicago deep dish", longDesc: "This is definitely a classic Chicago style deep dish pizza...you know, the kind you have to eat with a fork and kinfe."), PizzaPlace(name: "Pizza Castle", rank: .top20, shortDesc: "A Southside mainstay", longDesc: "A staple on the southside of Chicago. Everyone South of Roosevelt should know this location."), PizzaPlace(name: "Pequod's", rank: .top15, shortDesc: "The caramelized crust you crave.", longDesc: "Many a late night have college students ordered from Pequod's. It's how you survive finals."), PizzaPlace(name: "Pizano's", rank: .top15, shortDesc: "Oprah's Favorite", longDesc: "Yes. That's right! You get a pizza, and you get a pizza, and you get a pizza, everyone get's pizzaaaaaaaaaaaas!!!!"), PizzaPlace(name: "Paulie Gee's", rank: .top15, shortDesc: "Brooklyn, meet Logan Square", longDesc: "Chicagoan's take pride in their pizza, typically NY style is met with suspiscion. However, Paulie Gee's might be the only exception in the city."), PizzaPlace(name: "Art of Pizza", rank: .top15, shortDesc: "A true masterpiece", longDesc: "One of the best and coziest pizza places in Chicago"), PizzaPlace(name: "Rosangela's", rank: .top10, shortDesc: "Southside thin crust done right", longDesc: "A perfect homage to thin crust pizza"), PizzaPlace(name: "Coalfire", rank: .top10, shortDesc: "Burnt in the best kind of way", longDesc: "Fired over coals and baked to perfection, the slightly singed/burnt edges is the best part."), PizzaPlace(name: "Forno Rosso", rank: .top10, shortDesc: "Napolatina", longDesc: "This offers the kind of pizza crust your Italian Grandma used to make"), PizzaPlace(name: "Home Run Inn", rank: .top10, shortDesc: "Is it even a question?", longDesc: "A Chicago staple, and available frozen all over the city."), PizzaPlace(name: "Giordano's", rank: .top5, shortDesc: "Ranking #5", longDesc: "This is the original Chicago OG of pizza."), PizzaPlace(name: "Bonci", rank: .top5, shortDesc: "The pizza restaurant in Chicago that serves Roman style", longDesc: "Something like you have never seen before!"), PizzaPlace(name: "Connie's", rank: .top5, shortDesc: "Chicago's Own", longDesc:"Tradition since 1963"), PizzaPlace(name: "Lou Malnati's", rank: .top5, shortDesc: "You already knew it. #1", longDesc: "The BEST pizza in Chicago")]

class PizzaListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pizzaPlaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pizzaplace = pizzaPlaces[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: pizzaplace.rank.rawValue, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = pizzaplace.name
        cell.detailTextLabel?.text = pizzaplace.shortDesc

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? PizzaDetailViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                detailViewController.pizzaPlace = pizzaPlaces[indexPath.row]
            }
        }
    }
    

}
