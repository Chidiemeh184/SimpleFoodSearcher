//
//  RecipeTableViewController.swift
//  SimpleFoodSearcher
//
//  Created by Chidi Emeh on 8/10/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController {

    
    //Class Properties
    var recipes : [Recipe]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
       // return 10
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        cell.setRecipe(withRecipe: recipes[indexPath.row])
        return cell
    }
    
    
    @IBAction func closeTapped(_ sender: Any) {
      navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
    navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
