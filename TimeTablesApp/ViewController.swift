//
//  ViewController.swift
//  TimeTablesApp
//
//  Created by Rambo on 9/17/16.
//  Copyright © 2016 Rambo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveName(_ sender: AnyObject) {

       UserDefaults.standard.set(nameTextField.text, forKey: "name")
        
    }
    
    
    @IBAction func sliderPressed(_ sender: AnyObject) {
        
        table.reloadData()
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 50
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = String((indexPath.row + 1) * Int((slider.value)*20))
        
        return cell
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nameObject = UserDefaults.standard.object(forKey: "name")
        
        if let name = nameObject as? String {
            
            nameLbl.text = "Welcome \(name)"
            nameTextField.isHidden = true
            saveButton.isHidden = true
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

