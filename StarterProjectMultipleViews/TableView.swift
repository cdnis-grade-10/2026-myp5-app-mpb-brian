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
    
    //catches data handed over from the selected department
    //? indicates if the selected department is unclear then act as a nil and handles nothing
    var selectedDepartment: Department?
    
    
    
    // MARK: - IBActions and Functions
    
    
    //counts number of items to be presented in this table by .count from the struct
    //?? indicates a nil if counted nothing then say there are 0 teachers in this department
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedDepartment?.departmentTeacher.count ?? 0
    }
    
    //like the collection view, this confirms the custom cell to be projected and deques the cell that identifies as "cell" to be a custom table view cell
    //this wasn't created with a XIB file as the custom cell is declared on the main.py as a swift file only
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        //ideentifies the teachers stored in the struct and there order through indexPath.row and projects the following argument of the parameter for that teacher
        if let teacher = selectedDepartment?.departmentTeacher[indexPath.row] {
            
            cell.nameLabel.text = teacher.teacherName
            cell.roleLabel.text = teacher.teacherRole
            cell.iconImageView.image = UIImage(named: "profileImage")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //guard act as a saftey procedure to prevent crashing so that if the teacher wasn't clearly selected then the function returns
        guard let selectedTeacher = selectedDepartment?.departmentTeacher[indexPath.row] else{ return}
        
        
        //transition (segues)
        //looks through the whole project for the view controller with the identifier
        //as?(casting) tells the code to treat this view controller with a unqiue identity
        if let individualTeacherVC = storyboard?.instantiateViewController(withIdentifier: "IndividualTeacherViewController") as? IndividualTeacherViewController {
            
            //projects the chosen teacher and data onto the next  VC through above sequence
            individualTeacherVC.selectedTeacher = selectedTeacher
            
            //navigation from this collection view to transition to the next VC
            navigationController?.pushViewController(individualTeacherVC, animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //displayes a title for this VC as department name
        if let departmentName = selectedDepartment?.departmentName {
            self.title = "\(departmentName) Teachers"
        }
        
        
        
        // Do any additional setup after loading the view.
    }
}
