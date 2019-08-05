//
//  ShowScoreViewController.swift
//  Quiz-App
//
//  Created by Ayush Sharma on 25/06/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class ShowScoreViewController: UIViewController {
    
    
    //MARK: - Outlets
   
    @IBOutlet weak var scoreLBL: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    //MARK: - Variables
    var trackArr = [Int]()
    var score = 0
    var questions = [QA]()
    var imageName = " "
    
    
    //MARK: - Lifecycle Methods
   
    //It contains the logic for setting the score label accordingly if the score is greater than 33 % or not.
    override func viewDidLoad() {
        
        super.viewDidLoad()
        startBtn.layer.cornerRadius = 8
        
        // increase the score by 1 for every correct answer in the Track Array.
        for i in 0..<questions.count
        {
            if(trackArr[i] == questions[i].answer)
            {
                self.score += 1
            }
        }
        
        if((self.score*100)/questions.count >= 33)
        {
            imageName = "HappySmile"
            scoreLBL.text = "Congratulations!! your score is \(self.score)"
            startBtn.setTitle(" Improve YourSelf! ", for: .normal)
        }
        else
        {
            imageName = "SadSmile"
            scoreLBL.text = "You are fail. Your Score is \(self.score)"
            startBtn.setTitle(" Reattampt the Quiz ", for: .normal)
        }
        
        let image: UIImage = UIImage(named: imageName)!
        
        let imageView = UIImageView(image: image)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        if(screenSize.height<=640)
        {
        
        }
        else
        {
        if(UIDevice.current.orientation == .portrait)
        {
            imageView.frame = CGRect(x:screenSize.width/4,y:screenSize.height/7,width:232,height:172)
            self.view.addSubview(imageView)
        }
        else
        {
            imageView.isHidden = true
        }
        }
        
    
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
