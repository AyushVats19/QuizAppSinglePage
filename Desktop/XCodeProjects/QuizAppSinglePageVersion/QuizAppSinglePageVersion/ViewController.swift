//
//  ViewController.swift
//  QuizAppSinglePageVersion
//
//  Created by Ayush Sharma on 02/07/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - outlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - variables
    var options = Array<String>(repeating: " ", count: 4)
    var questions = [QA]()
    var currentSection = 0
    var attemptCount = 0
    var trackArr = Array<Int>(repeating: 0, count: 20)
    var allAttempted = 0
    var isAlreadyAttempted = Array<Bool>(repeating: false, count: 10)
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.sectionHeaderHeight = 135
       
        let fetchRequest: NSFetchRequest = QA.fetchRequest()
        
        do
        {
            let data = try  PersistanceService.context.fetch(fetchRequest)
            self.questions=data
        }catch{}

        tableView.reloadData()
    }
    
    //MARK: - prepare() method
    
    //prepare the data to perform the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ShowScoreViewController
        vc.trackArr = self.trackArr
        vc.questions = self.questions
    }
    
    //MARK: - prepareData() method
    
    //prepareData() method is called for every section to create options() arrays
    func prepareData()
    {
        debugPrint("Section: \(currentSection)")

        self.options[0] = self.questions[currentSection].option1!
        self.options[1] = self.questions[currentSection].option2!
        self.options[2] = self.questions[currentSection].option3!
        self.options[3] = self.questions[currentSection].option4!
    }
    
    //MARK: - createData()
    
    //createData() method is called once in the project from AppDelegate and it is used to create the CoreData
    func createData()
    {
        let managedContext = PersistanceService.context
        
        let qaEntity = NSEntityDescription.entity(forEntityName: "QA", in: managedContext)!
        
        let ques1 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques1.setValue("What is the size of double variable?", forKey: "question")
        ques1.setValue("8 Bit", forKey: "option1")
        ques1.setValue("16 Bit", forKey: "option2")
        ques1.setValue("32 Bit", forKey: "option3")
        ques1.setValue("64 Bit", forKey: "option4")
        
        ques1.setValue(4, forKey: "answer")
        
        let ques2 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques2.setValue("What is the default value of long variable?", forKey: "question")
        ques2.setValue("0", forKey: "option1")
        ques2.setValue("0.0", forKey: "option2")
        ques2.setValue("0L", forKey: "option3")
        ques2.setValue("not defined", forKey: "option4")
        
        ques2.setValue(3, forKey: "answer")
        
        let ques3 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques3.setValue("Which of the following is not a access specifier in java?", forKey: "question")
        ques3.setValue("public", forKey: "option1")
        ques3.setValue("private", forKey: "option2")
        ques3.setValue("protected", forKey: "option3")
        ques3.setValue("final", forKey: "option4")
        
        ques3.setValue(4, forKey: "answer")
        
        let ques4 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques4.setValue("In which case, a program is expected to recover?", forKey: "question")
        ques4.setValue("If an error occurs.", forKey: "option1")
        ques4.setValue("If an exception occurs.", forKey: "option2")
        ques4.setValue("Both of the above", forKey: "option3")
        ques4.setValue("None of the above", forKey: "option4")
        
        ques4.setValue(2, forKey: "answer")
        
        let ques5 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques5.setValue("Which of the following is not a Java Keyword?", forKey: "question")
        ques5.setValue("static", forKey: "option1")
        ques5.setValue("public", forKey: "option2")
        ques5.setValue("final", forKey: "option3")
        ques5.setValue("extension", forKey: "option4")
        
        ques5.setValue(4, forKey: "answer")
        
        let ques6 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques6.setValue("Choose the appropriate data type of the value 5.5.", forKey: "question")
        ques6.setValue("int", forKey: "option1")
        ques6.setValue("float", forKey: "option2")
        ques6.setValue("double", forKey: "option3")
        ques6.setValue("None of the above", forKey: "option4")
        
        ques6.setValue(2, forKey: "answer")
        
        let ques7 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques7.setValue("Java runs on ___", forKey: "question")
        ques7.setValue("Windows", forKey: "option1")
        ques7.setValue("Mac", forKey: "option2")
        ques7.setValue("Linux", forKey: "option3")
        ques7.setValue("All of the above", forKey: "option4")
        
        ques7.setValue(4, forKey: "answer")
        
        
        let ques8 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques8.setValue("What is the default value of local variables?", forKey: "question")
        ques8.setValue("0", forKey: "option1")
        ques8.setValue("null", forKey: "option2")
        ques8.setValue("No default value", forKey: "option3")
        ques8.setValue("Depends on data type", forKey: "option4")
        
        ques8.setValue(4, forKey: "answer")
        
        let ques9 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques9.setValue("What is the size of char in Java?", forKey: "question")
        ques9.setValue("4 bits", forKey: "option1")
        ques9.setValue("8 bits", forKey: "option2")
        ques9.setValue("16 bits", forKey: "option3")
        ques9.setValue("32 bits", forKey: "option4")
        
        ques9.setValue(3, forKey: "answer")
        
        let ques10 = NSManagedObject(entity: qaEntity, insertInto: managedContext)
        
        ques10.setValue("Which of the following classes are available in java.lang package?", forKey: "question")
        ques10.setValue("Stack", forKey: "option1")
        ques10.setValue("Object", forKey: "option2")
        ques10.setValue("Vector", forKey: "option3")
        ques10.setValue("Random", forKey: "option4")
        
        ques10.setValue(2, forKey: "answer")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    //MARK: - TableViewDelegate and TableViewDataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    // contains the logic to load the options to the cell label text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        currentSection = indexPath.section
        
        //prepareData() is called to setup the options Array according to the Current Section.
       
        prepareData()
        
        cell.textLabel?.text = options[indexPath.row]
        
        //if the particular question is answered then change the color of the selected row according to the correct or incorrect answer.
        
        if  (trackArr[indexPath.section] > 0 && indexPath.row == trackArr[indexPath.section] - 1) {
            if(trackArr[indexPath.section] == questions[indexPath.section].answer)
            {
                cell.backgroundColor = UIColor.green
                cell.contentView.backgroundColor = UIColor.green
            }
            else
            {
                cell.backgroundColor = UIColor.red
                cell.contentView.backgroundColor = UIColor.red
            }
        }
        
        else{
            cell.backgroundColor = UIColor.white
            cell.contentView.backgroundColor = UIColor.white
            
        }
        
        //Decorating the cell
        cell.textLabel?.text = self.options[indexPath.row]
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 10
       
        return cell
    }
  
  //Sets the section header to the particular question from the coredata
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        debugPrint("Section number in ViewForHeader \(section)")
    
        let questionLBL = UILabel()
        
        questionLBL.text = " \(section+1). \(questions[section].question!)"
        questionLBL.lineBreakMode = .byWordWrapping
    
        questionLBL.textColor = .black
        questionLBL.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)

        questionLBL.numberOfLines = 0
        questionLBL.textAlignment = .center
        return questionLBL
    }
 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 135
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == questions.count-1 ? 100 : 0
    }
    
    //Called when a row is selected. If a question is already attempted then the user can not reattempt it
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isAlreadyAttempted[indexPath.section])
        {
            
        }
        else
        {
            self.trackArr[indexPath.section] = indexPath.row+1
            isAlreadyAttempted[indexPath.section] = true
           
        }
        tableView.reloadData()

    }
    
    //Add a submit button to the footer of the last section of the tableView.
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        
        if(section == questions.count-1)
        {
            footerView.backgroundColor = .white
     
            let sbmtBtn = UIButton()
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            
            sbmtBtn.frame = CGRect(x: screenWidth/2-50, y: 20, width: 100, height: 40)
            sbmtBtn.setTitle("Submit", for: .normal)
            sbmtBtn.setTitleColor(UIColor.white, for: .normal)
            sbmtBtn.backgroundColor = .purple
            sbmtBtn.isEnabled = true
            sbmtBtn.layer.borderWidth = 2
            sbmtBtn.layer.cornerRadius = 10
            sbmtBtn.addTarget(self, action: #selector(sbmtButtonAction), for: .touchUpInside)
            
            footerView.addSubview(sbmtBtn)
        }
        return footerView
    }
 
    //MARK: - Action method for submit button tap
    @objc func sbmtButtonAction(sender: UIButton!)
    {
        //allAttempted will remain 0 if any of the question is attempted and the attemptCount will also be increased by 1.
        
        for i in 0..<questions.count
        {
            if(trackArr[i] == 0)
            {
                self.allAttempted = 1
            }
            else
            {
                attemptCount = attemptCount + 1
                self.allAttempted = 0
                debugPrint(attemptCount)
            }
        }
        
        // if all questions are attempted then only perform the segue on the submit button tap otherwise show the alert to the user
        
        if(self.allAttempted == 0 && attemptCount >= questions.count-1)
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
        else
        {
            let alertController = UIAlertController(title: nil, message: "Attempt All Questions", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
    }
}


