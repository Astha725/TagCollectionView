//
//  ViewController.swift
//  TagcollectionView
//
//  Created by Rohit Bisht on 29/09/21.
//

import UIKit

let kScrollDirectionIsHorizontal = false
let kShouldRefresh = false

class ViewController: UIViewController {
    var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    let strings = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
                   "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
                   "on", "constraints", "placed", "on", "those", "views"]
    var listItems: Array<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Animals_name: String = "Animals Name"
        let Animals_Names_List = ["Ant", "Bear", "Buffalo", "Butterfly", "Camel", "Cat", "Chameleon", "Chimpanzee", "Cow", "Crab", "Crocodile", "Deer", "Dog", "Donkey", "Elephant", "Fox", "Frog", "Goat", "Gorilla", "Hippopotamus", "Horse", "Jackal", "Lion", "Lizard", "Mongoose", "Monkey", "Mosquito", "Mouse", "Ox", "Pig", "Polar Bear", "Rabbit", "Rhinoceros", "Sheep", "Snail" ,"Snake", "Spider", "Squirrel", "Tiger", "Turtle", "Wolf", "Giraffe", "Zebra"]
        
        let Dry_Fruits_Name: String = "Dry fruits"
        let Dry_Fruits_Names_List = ["Almond", "Anise", "Apricot", "Arrowroot", "Betel-nut", "Cantaloupe Seeds", "Cashew nut", "Chestnut", "Coconut", "Cudpahnut", "Currant", "Dates Dried", "Dates", "Fig", "Flax seeds", "Groundnuts, Peanuts,Lotus Seeds Pop,Gorgon Nut Puffed Kernel", "Nut, Walnuts", "Pine Nut", "Pistachio", "Prunes", "Pumpkin Seeds", "Saffron", "Sesame Seeds", "Sugar candy", "Watermelon Seeds"]
        
        let Params_Animals:[String: Any] = ["title": Animals_name, "list": Animals_Names_List]
        let Params_Dry_Fruits:[String: Any] = ["title": Dry_Fruits_Name, "list": Dry_Fruits_Names_List]
        
        self.listItems = [Params_Animals,Params_Dry_Fruits]
        
        layout  = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView?.collectionViewLayout = layout
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


}


class ProductCllctnCell: UICollectionViewCell {
    
    @IBOutlet weak var lblProduct: UILabel!
    
}

// MARK:-  UICollectionViewDelegate , UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       //#warning Incomplete method implementation -- Return the number of sections
       return listItems.count
   }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return strings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCllctnCell", for: indexPath) as! ProductCllctnCell
        
        cell.lblProduct.text = strings[indexPath.row]
 //       cell.lblProduct.backgroundColor = .red
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = cell.frame.size.height / 2
        return cell
    
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     
    }
    
}

//MARK:- UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if kScrollDirectionIsHorizontal {
//            return CGSize(width: 60, height: CGFloat((arc4random() % 120) + 60))
//        } else {
//            return CGSize(width: CGFloat((arc4random() % 120) + 60), height: 60)
//        }
//
//    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
       return CGSize.init(width: collectionView.bounds.width, height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //Use for size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
   //     let itemsObject: [String: Any] = listItems[indexPath.section] as! [String: Any]
     //   let items: Array<Any> = itemsObject["list"] as! Array<Any>
        let name: String = strings[indexPath.row]
    
        let size: CGSize = name.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
        
        let sizeNew: CGSize = CGSize.init(width:((size.width  > collectionView.frame.size.width) ? collectionView.frame.size.width - 20 : size.width), height: size.height)

        return sizeNew
    }

}

