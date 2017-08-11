//
//  RecipeTableViewCell.swift
//  SimpleFoodSearcher
//
//  Created by Chidi Emeh on 8/10/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    
    //UI Properties
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setRecipe(withRecipe: Recipe){
        
        //TODO: Work on getting ingredients to show
        
        if let thumbnailURL = URL(string: withRecipe.thumbnail!) {
            let imageUrl = thumbnailURL
            let imageProcessor = NetworkProcessor(url: imageUrl)
            imageProcessor.downloadImageData { (ImageData) in
                //Download Image on Main Queue
                DispatchQueue.main.async {
                    self.recipeImageView.image = UIImage(data: ImageData!)
                }
            }
        } else {
            self.recipeImageView.image = UIImage(named: "placeholder.png")
        }

        titleLabel.text = withRecipe.title
        ingredientLabel.text? = withRecipe.ingredients!
            
        siteLabel.text = withRecipe.href
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
