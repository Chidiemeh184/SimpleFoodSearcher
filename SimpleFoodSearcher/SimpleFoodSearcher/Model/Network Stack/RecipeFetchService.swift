//
//  RecipeFetchService.swift
//  SimpleFoodSearcher
//
//  Created by Chidi Emeh on 8/10/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation
//This class builds the required url for
//the API calls. The way the url is constructed
//is bases on the parameters as defined in the Recipe
//Puppy API
//For a valid constructed url, the class will initialize
//a Recipe object using the Recipe Class and the NetworkProcessor
//class
class RecipeFetchService {
    
    //Sample Constructed Valid URL Looks like this
    //For example:
    //http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3
    
    //Optional Parameters:
    //i : comma delimited ingredients
    //q : normal search query
    //p : page
    
    let baseURL = "http://www.recipepuppy.com/api/"
    typealias recipeResultDictionary = ([Recipe])-> Void
    
    //Returns Recipes for provided ingredients by a completion block
    //Ingredients must be an parsed comma separated value string
    //already processed by the provider
    func fetchRecipe(withIngredients: String, completion: @escaping recipeResultDictionary){
        let url = URL(string: "\(baseURL)?i=\(withIngredients)&p=3")
        let networkCall = NetworkProcessor(url: url!)
        
        networkCall.downloadJSONData { (result) in
            //Get data for key "result"
            var recipes = [Recipe]()
            if let jsonData = result?["results"] as? [[String : Any]?] {
                //print(jsonData)
                
                for item in jsonData {
                    if let found = item {
                        let recipe = Recipe(withDictionary: found)
                        recipes.append(recipe)
                    }
                }
                completion(recipes)
            }
        }
    }
    
    //Returns Recipes for a provided Recipe Name by a completion block
    //Recipe name must be parsed by the provider
    //Eg: Rice , or Fried+Rice if with space
    func fetcRecipe(withRecipeName: String, completion: @escaping recipeResultDictionary){
        let url = URL(string: "\(baseURL)?q=\(withRecipeName)&p=3")
        let networkCall = NetworkProcessor(url: url!)
        
        networkCall.downloadJSONData { (result) in
            //Get data for key "result"
            var recipes = [Recipe]()
            if let jsonData = result?["results"] as? [[String : Any]?] {
                //print(jsonData)
                for item in jsonData {
                    if let found = item {
                        let recipe = Recipe(withDictionary: found)
                        recipes.append(recipe)
                    }
                }
                completion(recipes)
                //print(recipes)
            }
        }
    }
    
    //Returns Recipe for a set of provided ingredients and RecipeName
    //Provider must prepare inputs as explained in the methods above
    func fetchRecipe(withIngredients: String, recipeName: String, completion: @escaping recipeResultDictionary) {
        ////http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3
        let url = URL(string: "\(baseURL)?i=\(withIngredients)&q=\(recipeName)&p=3")
        let networkCall = NetworkProcessor(url: url!)
        
        networkCall.downloadJSONData { (result) in
            //Get data for key "result"
            var recipes = [Recipe]()
            if let jsonData = result?["results"] as? [[String : Any]?] {
                //print(jsonData)
                
                for item in jsonData {
                    if let found = item {
                        let recipe = Recipe(withDictionary: found)
                        recipes.append(recipe)
                    }
                }
                completion(recipes)
            }
        }
        
        
    }
    
    
}//End Class RecipeFetchService
