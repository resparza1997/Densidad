//
//  ViewControllerSettings.swift
//  Densidad
//
//  Created by José Arturo Villalobos Castro on 4/6/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerSettings: UIViewController {

    
    @IBOutlet weak var swSonido: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        preferredContentSize = CGSize(width: 250, height: 220)
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
