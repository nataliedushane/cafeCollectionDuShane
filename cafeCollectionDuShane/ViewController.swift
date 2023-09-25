//
//  ViewController.swift
//  cafeCollectionDuShane
//
//  Created by NATALIE DUSHANE on 9/12/23.
//

import UIKit

class ViewController: UIViewController {
    var food = ["Hotdog", "Hamburger", "Soup", "Brownie", "12 Carat Gold Steak"]
    var price = [3.01, 1.65, 4.01, 6.01, 1900.75]
    var foodString = ""
    var priceString = ""
    var newPrice = [0.0]
    var newFood = [""]
    var cartDict : [String: Double] = [:]
    var cartString = ""
    var cartAmt = 0.0
    var len = 0
    var password = "natnap"
    
    @IBOutlet weak var foodEnter: UITextField!
    
    @IBOutlet weak var costEnter: UITextField!
    
    @IBOutlet weak var passwordEnter: UITextField!
    
    @IBOutlet weak var cartOutlet: UILabel!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var amountOutlet: UITextField!
    @IBOutlet weak var foodOutlet: UITextField!
    
    @IBOutlet weak var priceOutlet: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLabel.isHidden = true
        change()
    }
    
    @IBAction func menuAction(_ sender: Any) {
        foodString = ""
        var priceOrg : [Double] = []
        let foodOrg = food.sorted(by: <)
        for i in 0..<food.count{
            for f in 0..<food.count{
                if(foodOrg[i] == food[f]){
                    priceOrg.append(price[f])
                }
            }
        }
        for i in 0..<food.count{
            foodString = "\(foodString) \n \(foodOrg[i]) is $\(priceOrg[i])"
        }
        priceOutlet.text = foodString
    }
    
    @IBAction func priceAction(_ sender: Any) {
        change()
        
    }
    
    @IBAction func orderOutlet(_ sender: Any) {
        order()
    }
    
    @IBAction func addButton(_ sender: Any) {
        if(password == passwordEnter.text){
            food.append(foodEnter.text!)
            price.append((Double)(costEnter.text!)!)
            change()
        }
        else{
            
            
            self.myLabel.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.myLabel.isHidden = true
            }
            
            
        }
        
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if(password == passwordEnter.text){
            
            for i in 0..<food.count{
                if(foodEnter.text == food[i]){
                    food.remove(at: i)
                    break
                }
            }
            for i in 0..<price.count{
                if((Double)(costEnter.text!) == price[i]){
                    price.remove(at: i)
                    break
                }
            }
            change()
        }
        else{
            self.myLabel.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                
                self.myLabel.isHidden = true
            }
        }
        foodEnter.text = ""
        costEnter.text = ""
    }
        
        
        
        
        
        func order(){
            let foo = foodOutlet.text
            cartString = ""
            if(food.contains(foo!)){
                for i in 0..<food.count{
                    
                    if(food[i] == foo){
                        cartDict[food[i]] = ((Double)(amountOutlet.text!)!)
                        
                        if(len<cartDict.count){
                            cartAmt = cartAmt + ((Double)(amountOutlet.text!)!) * (price[i])
                            for (key, val) in cartDict{
                                cartString = "\(cartString) \n \(val) \(key)(s)"
                                totalOutlet.text = "Total is: $\(cartAmt)"
                            }
                            len = cartDict.count
                            cartOutlet.text = cartString
                        }
                        else{
                            cartOutlet.text = "Please enter a new item."
                        }
                    }
                }
            }
            else{
                cartOutlet.text = "Please enter a valid item"
            }
            foodOutlet.text = ""
            amountOutlet.text = ""
        }
        
        func change(){
            foodString = ""
            var foodOrg : [String] = []
            let priceOrg = price.sorted(by: <)
            for i in 0..<food.count{
                for f in 0..<food.count{
                    if(priceOrg[i] == price[f]){
                        foodOrg.append(food[f])
                    }
                }
            }
            for i in 0..<food.count{
                foodString = "\(foodString) \n \(foodOrg[i]) is $\(priceOrg[i])"
            }
            priceOutlet.text = foodString
        }
        
    }
    
    

