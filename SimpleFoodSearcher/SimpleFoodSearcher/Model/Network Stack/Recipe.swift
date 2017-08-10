//
//  Recipe.swift
//  SimpleFoodSearcher
//
//  Created by Chidi Emeh on 8/10/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation
//A Single Recipe Response from API Call
//from Recipe Puppy API
class Recipe {
    
    let ingredients : [String]?
    let title : String?
    let href : String?
    let thumbnail : String?
    
    struct recipeAPIKeys {
        static let ingredients = "ingredients"
        static let title = "title"
        static let href =  "href"
        static let thumbnail = "thumbnail"
    }
    
    
    init(withDictionary: [String : Any]){
        ingredients = withDictionary[recipeAPIKeys.ingredients] as? [String]
        title = withDictionary[recipeAPIKeys.title] as? String
        href = withDictionary[recipeAPIKeys.href] as? String
        thumbnail = withDictionary[recipeAPIKeys.thumbnail] as? String
    }
    
}//End class Recipe
