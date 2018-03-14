//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Sarata Bartlomiej on 14.03.2018.
//  Copyright © 2018 Bartłomiej Sarata. All rights reserved.
//

import UIKit
import RealmSwift
class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()

    var categories: Results<Category>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }
    //MARK: - Table View Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Nil coleasing operator
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
    //MARK: - Table View Delagate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
        //self.saveCategories()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    //Add New Category
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert  = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (actiom) in
            //what will happen once the user clicks the AddItem button on our UIAlert
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
        }
        
        present(alert,animated: true, completion: nil)
    }
    
    //MARK: - Data Manipulation Methods
    func save(category: Category){
        do{
            try realm.write {
                realm.add(category)
            }
        }catch{
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        categories = realm.objects(Category.self)
        tableView.reloadData()
    }

}
