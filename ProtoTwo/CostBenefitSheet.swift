//
//  CostBenefitSheet.swift
//  
//
//  Created by Don on 2016-08-20.
//
//



import UIKit

class CostBenefitSheet: UIViewController {

    @IBOutlet weak var benSmokeLabel: UILabel!
 
    @IBOutlet weak var benSmokeMessageOne: UITextField!

    @IBOutlet weak var benSmokePointsOne: UITextField!
 
    @IBOutlet weak var benSmokeMessageTwo: UITextField!

    @IBOutlet weak var benSmokePointsTwo: UITextField!
    @IBOutlet weak var benSmokeMessageThree: UITextField!
    @IBOutlet weak var benSmokePointsThree: UITextField!
    @IBOutlet weak var benSmokeMessageFour: UITextField!
    @IBOutlet weak var benSmokePointsFour: UITextField!
    @IBOutlet weak var benSmokeMessageFive: UITextField!
    @IBOutlet weak var benSmokePointsFive: UITextField!
    @IBOutlet weak var benSmokeTotalLabel: UILabel!
    @IBOutlet weak var benSmokeTotalPoints: UITextField!


    @IBOutlet weak var costSmokeLabel: UILabel!
    @IBOutlet weak var costSmokeMessageOne: UITextField!
    @IBOutlet weak var costSmokePointsOne: UITextField!
    @IBOutlet weak var costSmokeMessageTwo: UITextField!
    @IBOutlet weak var costSmokePointsTwo: UITextField!
    @IBOutlet weak var costSmokeMessageThree: UITextField!
    @IBOutlet weak var costSmokePointsThree: UITextField!
    @IBOutlet weak var costSmokeMessageFour: UITextField!
    @IBOutlet weak var costSmokePointsFour: UITextField!
    @IBOutlet weak var costSmokeMessageFive: UITextField!
    @IBOutlet weak var costSmokePointsFive: UITextField!
    @IBOutlet weak var costSmokeTotalLabel: UILabel!
    @IBOutlet weak var costSmokeTotalPoints: UITextField!


    
    @IBOutlet weak var benNotSmokeLabel: UILabel!
    @IBOutlet weak var benNotSmokeMessageOne: UITextField!
    @IBOutlet weak var benNotSmokePointsOne: UITextField!
    @IBOutlet weak var benNotSmokeMessageTwo: UITextField!
    @IBOutlet weak var benNotSmokePointsTwo: UITextField!
    @IBOutlet weak var benNotSmokeMessageThree: UITextField!
    @IBOutlet weak var benNotSmokePointsThree: UITextField!
    @IBOutlet weak var benNotSmokeMessageFour: UITextField!
    @IBOutlet weak var benNotSmokePointsFour: UITextField!
    @IBOutlet weak var benNotSmokeMessageFive: UITextField!
    @IBOutlet weak var benNotSmokePointsFive: UITextField!
    @IBOutlet weak var benNotSmokeTotalLabel: UILabel!
    @IBOutlet weak var benNotSmokeTotalPoints: UITextField!
    
    @IBOutlet weak var costNotSmokeLabel: UILabel!
    @IBOutlet weak var costNotSmokeMessageOne: UITextField!
    @IBOutlet weak var costNotSmokePointsOne: UITextField!
    @IBOutlet weak var costNotSmokeMessageTwo: UITextField!
    @IBOutlet weak var costNotSmokePointsTwo: UITextField!
    @IBOutlet weak var costNotSmokeMessageThree: UITextField!
    @IBOutlet weak var costNotSmokePointsThree: UITextField!
    @IBOutlet weak var costNotSmokeMessageFour: UITextField!
    @IBOutlet weak var costNotSmokePointsFour: UITextField!
    @IBOutlet weak var costNotSmokeMessageFive: UITextField!
    @IBOutlet weak var costNotSmokePointsFive: UITextField!
    @IBOutlet weak var costNotSmokeTotalLabel: UILabel!
    @IBOutlet weak var costNotSmokeTotalPoints: UITextField!


    @IBOutlet weak var totalForSmokingLabel: UILabel!
    @IBOutlet weak var totalForSmokingPoints: UITextField!
    @IBOutlet weak var totalForNotSmokingLabel: UILabel!
    @IBOutlet weak var totalForNotSmokingPoints: UITextField!

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setUpScrollView()
        print("finshed set up scroll")
       
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews();
        
        self.scrollView.frame = self.view.bounds // Instead of using auto layout
        //self.scrollView.contentSize.height = 3000; // Or whatever you want it to be.
    }
    
    

    //Set up scroll view ( I Hope!)
    func setUpScrollView () {
        print("Her and here")
       self.view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(benSmokeLabel)
        containerView.addSubview(benSmokeMessageOne)
        containerView.addSubview(benSmokeMessageTwo)
        containerView.addSubview(benSmokeMessageThree)
        containerView.addSubview(benSmokeMessageFour)
        containerView.addSubview(benSmokeMessageFive)
        containerView.addSubview(benSmokePointsOne)
        containerView.addSubview(benSmokePointsTwo)
        containerView.addSubview(benSmokePointsThree)
        containerView.addSubview(benSmokePointsFour)
        containerView.addSubview(benSmokePointsFive)
        containerView.addSubview(benSmokeTotalLabel)
        containerView.addSubview(benSmokeTotalPoints)
        
        
        
        containerView.addSubview(costSmokeLabel)
        containerView.addSubview(costSmokeMessageOne)
        containerView.addSubview(costSmokeMessageTwo)
        containerView.addSubview(costSmokeMessageThree)
        containerView.addSubview(costSmokeMessageFour)
        containerView.addSubview(costSmokeMessageFive)
        containerView.addSubview(costSmokePointsOne)
        containerView.addSubview(costSmokePointsTwo)
        containerView.addSubview(costSmokePointsThree)
        containerView.addSubview(costSmokePointsFour)
        containerView.addSubview(costSmokePointsFive)
        containerView.addSubview(costSmokeTotalLabel)
        containerView.addSubview(costSmokeTotalPoints)
        
        containerView.addSubview(benNotSmokeLabel)
        containerView.addSubview(benNotSmokeMessageOne)
        containerView.addSubview(benNotSmokeMessageTwo)
        containerView.addSubview(benNotSmokeMessageThree)
        containerView.addSubview(benNotSmokeMessageFour)
        containerView.addSubview(benNotSmokeMessageFive)
        containerView.addSubview(benNotSmokePointsOne)
        containerView.addSubview(benNotSmokePointsTwo)
        containerView.addSubview(benNotSmokePointsThree)
        containerView.addSubview(benNotSmokePointsFour)
        containerView.addSubview(benNotSmokePointsFive)
        containerView.addSubview(benNotSmokeTotalLabel)
        containerView.addSubview(benNotSmokeTotalPoints)
        
        containerView.addSubview(costNotSmokeLabel)
        containerView.addSubview(costNotSmokeMessageOne)
        containerView.addSubview(costNotSmokeMessageTwo)
        containerView.addSubview(costNotSmokeMessageThree)
        containerView.addSubview(costNotSmokeMessageFour)
        containerView.addSubview(costNotSmokeMessageFive)
        containerView.addSubview(costNotSmokePointsOne)
        containerView.addSubview(costNotSmokePointsTwo)
        containerView.addSubview(costNotSmokePointsThree)
        containerView.addSubview(costNotSmokePointsFour)
        containerView.addSubview(costNotSmokePointsFive)
        containerView.addSubview(costNotSmokeTotalLabel)
        containerView.addSubview(costNotSmokeTotalPoints)
        
        containerView.addSubview(totalForSmokingLabel)
        containerView.addSubview(totalForNotSmokingLabel)
        containerView.addSubview(totalForSmokingPoints)
        containerView.addSubview(totalForSmokingPoints)
        
//        self.scrollView.contentSize = CGSizeMake(400.0, 1300.0)
    }

    @IBAction func saveButton(sender: UIButton){
    
        print("save pressed")
    
    
    }



}
