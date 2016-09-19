//
//  ViewController.swift
//  MneuTableViewSample

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    var  imagesArray: NSArray = []
    var  menuArray: NSArray = []
    var  subMenuDataArray: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        imagesArray = ["soups.jpg","salads.jpg","starters.jpg","pizzas.jpg","burgers.jpeg"]
        
        menuArray = ["Soups","Salads","Starters","Pizzas","Burgers"]
        
        subMenuDataArray = [["Cream of broccoli","Cream of celery","Cream of tomato","Etrog","Gazpacho"],
                            ["Tuna salad","Urnebes","Waldorf salad"],
                            ["Kakori Kebabs","Stir Fried Chilli Chicken"," Microwave Paneer Tikkas","Aloo and Dal ki Tikki","Cheese Balls","Bhuna Masala Chicken Wings"],
                            ["Cheese Pizzas","Chicken Pizzas","Masala Pizzas","Double Cheese Pizzas","Herbal Pizzas"],
                            ["Luger Burger","Le Pigeon Burger","The Company Burger","Dyer’s Deep-Fried Burger","The Lola Burger","Cheeseburger","Raw Steak Tartare Burger","Buckhorn Burger"]]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return imagesArray.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 70
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let  menuTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let cellImageView: UIImageView = UIImageView.init()
        cellImageView.frame = CGRectMake(10, 10, 50, 50)
        cellImageView.image =  UIImage(named: imagesArray.objectAtIndex(indexPath.row) as! String)
        menuTableViewCell.contentView.addSubview(cellImageView)
        
        let  menuLabel: UILabel = UILabel.init(frame: CGRectMake(70, 10, 200, 25))
        menuLabel.text = menuArray.objectAtIndex(indexPath.row) as? String
        menuTableViewCell.contentView.addSubview(menuLabel)

        
        return menuTableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let subMenuViewController: SubMenuViewController = storyboard!.instantiateViewControllerWithIdentifier("SubMenuViewControllerID") as! SubMenuViewController
        subMenuViewController.currentSubMenuArray = subMenuDataArray.objectAtIndex(indexPath.row) as! NSArray
        navigationController?.pushViewController(subMenuViewController, animated: true)
        
        
    }


}

