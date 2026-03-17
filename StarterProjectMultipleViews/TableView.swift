/*
 
 ViewControllerThree.swift
 
 This file will contain the code for the third viewcontroller.
 Please ensure that your code is organised and is easy to read.
 This means that you will need to both structure your code correctly,
 in addition to using the correct syntax for Swift.
 
 Unless you are told otherwise, ensure that you are using the
 camelCase syntax. For example, outputLabel and firstName are good
 examples of using the camelCase syntax.
 
 Within each class, you can see clearly identified sections denoted by
 MARK statements. These MARK statements allow you to structure and organise
 your code.
 
 - @IBOutlets should be listed under the MARK section on IBOutlets
 - Variables and constants listed under the MARK section Variables and Constants
 - Functions (including @IBActions) listed under the section on IBActions and Functions.
 
 As you develop each view controller class with Swift code, please include
 detailed comments to both demonstrate understanding, and which serve you as
 a reminder as to what your code actually does.
 
 */

import UIKit

class ViewControllerThree: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables and Constants
    
    var selectedDepartment: Department?
    
    
    
    // MARK: - IBActions and Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return selectedDepartment?.departmentTeacher.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
            
            if let teacher = selectedDepartment?.departmentTeacher[indexPath.row] {
                
                cell.nameLabel.text = teacher.teacherName
                cell.roleLabel.text = teacher.teacherRole
                cell.iconImageView.image = UIImage(named: "profileImage")
            }
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedTeacher = selectedDepartment?.departmentTeacher[indexPath.row] else{ return}
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "IndividualTeacherViewController") as? IndividualTeacherViewController {
            
            detailVC.selectedTeacher = selectedTeacher
            navigationController?.pushViewController(detailVC, animated: true)
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        if let departmentName = selectedDepartment?.departmentName {
            self.title = "\(departmentName) Teachers"
        }
        
       

        // Do any additional setup after loading the view.
    }
}
