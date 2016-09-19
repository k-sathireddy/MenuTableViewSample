//
//  SubMenuViewController.swift
//  MneuTableViewSample



import UIKit

class SubMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subMenuTableView: UITableView!
    var  currentSubMenuArray: NSArray = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         subMenuTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "subCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return currentSubMenuArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let  subMenuTableViewCell = tableView.dequeueReusableCellWithIdentifier("subCell", forIndexPath: indexPath)
        let  subMenuLabel: UILabel = UILabel.init(frame: CGRectMake(10, 10, 250, 25))
        subMenuLabel.text = currentSubMenuArray.objectAtIndex(indexPath.row) as? String
        subMenuTableViewCell.contentView.addSubview(subMenuLabel)
        return subMenuTableViewCell
    }

  
}
