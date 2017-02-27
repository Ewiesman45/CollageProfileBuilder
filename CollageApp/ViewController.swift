//
//  ViewController.swift
//  CollageApp
//
//  Created by Evan Wiesman on 2/8/17.
//  Copyright © 2017 Evan Wiesman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
  
    
    var myCollages:[CollageClass] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myCollages.append(CollageClass.init(Name: "Harper Collage", Location: "1200 W Algonquin Rd, Palatine, IL 60067", NumberOfStudents: "16,060", Image: (UIImage(named: "harpercollege"))!))
         myCollages.append(CollageClass.init(Name: "Collage of Lake County", Location: "19351 W Washington St, Grayslake, IL 60030", NumberOfStudents: "17,389", Image: (UIImage(named: "CollegeofLake"))!))
         myCollages.append(CollageClass.init(Name: "Adrian Collage", Location: "110 S Madison St, Adrian, MI 49221", NumberOfStudents: "1,650", Image: (UIImage(named: "adrian"))!))
        myCollages.append(CollageClass.init(Name: "University Of Oklahoma", Location: "660 Parrington Oval, Norman, OK 73019", NumberOfStudents: "31,250", Image: (UIImage(named: "universityofO"))!))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCollages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollages[indexPath.row].name
        cell.detailTextLabel?.text = myCollages[indexPath.row].numberOfStudents
        return cell
    }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if(editingStyle == .delete)
            {
                myCollages.remove(at: indexPath.row)
                tableView.reloadData()
            }
    }
    
    @IBAction func addCell(_ sender: Any) {
    let alert = UIAlertController(title: "Add Collage", message: nil, preferredStyle: .alert)
    alert.addTextField {
    (collageTextField) in collageTextField.placeholder = "Add collage here"
    }
    alert.addTextField {
    (locationTextField) in locationTextField.placeholder = "Location"
        }
        alert.addTextField {
        (locationTextField) in locationTextField.placeholder = "Location"
        
    }
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let add = UIAlertAction(title: "Add", style: .default) { (action) in
        self.myCollages.append(CollageClass(Name:(alert.textFields?[0].text)!, Location: (alert.textFields?[1].text)!))
        self.tableView?.reloadData()
    }
    alert.addAction(add)
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        let selectedRow = tableView?.indexPathForSelectedRow?.row
        
        detailView.collageDetail = myCollages[selectedRow!]
    }


}

