//
//  ViewController.swift
//  cafeMiniApp
//
//  Created by MYKAELA WALLEN on 9/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuOutlet: UILabel!
    
    @IBOutlet weak var cartOutlet: UILabel!
    
    @IBOutlet weak var foodTextOutlet: UITextField!
    
    @IBOutlet weak var quantityTextOutlet: UITextField!
    
    @IBOutlet weak var errorOutlet: UILabel!
    
    @IBOutlet weak var wrongPasswordOutlet: UILabel!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var foodDeleteOutlet: UITextField!
    
    @IBOutlet weak var foodAddOutlet: UITextField!
    
    @IBOutlet weak var addPriceOutlet: UITextField!
    
     var add = false
    
    
    var thing : [String] = ["Croissant", "Macarons", "Baguettes", "EClair", "Cake"]
    var price : [Double] = [3.00, 1.01, 6.08, 100.00, 15.0]
    var realMenu = ""
    var realCart = ""
    var cartDict = [String : Int]()
    var total = 0.00
    
    @IBOutlet weak var totalOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< thing.count {
            realMenu += "\(thing[i]) -------- \(price[i]) \n"
            
        }
        menuOutlet.text = realMenu
        
        
    }
    
    @IBAction func addToCart(_ sender: Any) {
        add = false
       
        
       var food = foodTextOutlet.text
        var number = Int(quantityTextOutlet.text!)
        if let f = food{
            if let n = number{
                
                for i in 0 ..< thing.count{
                    if(food == thing[i]){
                        
                        add = true
                        cartDict["\(thing[i])"] = number
                        
                        realCart += "\(cartDict[thing[i]]!)  \(thing[i])'s \n"
                        cartOutlet.text = realCart
                        total += price[i] * Double(number!)
                        totalOutlet.text = "Total: $\(total)"
                        errorOutlet.text = ""
                        
                    }
                    if(add == false){
                        errorOutlet.text = "Invalid Input"
                    }
                    
                }
            }
            else{
                errorOutlet.text = "Invalid Input"
            }
        }
        else{
            errorOutlet.text = "Invalid Input"
        }
        
        foodTextOutlet.text = ""
        quantityTextOutlet.text = ""
        
        
        

        
 }
    
    
    
    @IBAction func addAction(_ sender: UIButton) {
        var newFood = foodAddOutlet.text
        var newPrice = addPriceOutlet.text
        var doublePrice = Double(newPrice!)
        
        if (passwordOutlet.text == "Seaver"){
            if let n = newFood{
                if let p = Double(newPrice!){
                thing.append(newFood!)
                price.append(Double(newPrice!)!)
                menuOutlet.text = ""
                realMenu = ""
                
                for i in 0 ..< thing.count {
                    realMenu += "\(thing[i]) -------- \(price[i]) \n"
                    
                }
                menuOutlet.text = realMenu
            }
                else {
                    wrongPasswordOutlet.text = "Invalid item"
                }
        }
            else {
                wrongPasswordOutlet.text = "Invalid item"
            }
        }
        else {
            wrongPasswordOutlet.text = "wrong password stupid"
            
        }
        
        
    }
    
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        var deleteItem = foodDeleteOutlet.text!
        
        if (passwordOutlet.text == "Seaver"){
            
            for i in 0..<thing.count{
                if(deleteItem == thing[i]){
                    
                    thing.remove(at: i)
                    
                    menuOutlet.text = ""
                    realMenu = ""
                    
                    for i in 0..<thing.count{
                        realMenu += "\(thing[i])-------- \(price[i]) \n"
                    }
                    menuOutlet.text = realMenu
                    
                    
                }
            }
        }
        
        
    }
    
    
}

