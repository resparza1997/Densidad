//
//  ViewController.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 3/23/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var btSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue,
                 sender: Any?){
        if (sender as! UIButton) == btSettings{
            let vistaPopOver = segue.destination as! ViewControllerSettings
            vistaPopOver.popoverPresentationController!.delegate = self
        }
        
    }
    
    @IBAction func unwindRegresa(segue: UIStoryboardSegue){
        
    }
    
    
    //Pop Over
    func adaptivePresentationStyle (for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

