//
//  ViewControllerInformacion.swift
//  Densidad
//
//  Created by José Arturo Villalobos Castro on 5/1/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerInformacion: UIViewController {
    
    var bgColor : UIColor!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = bgColor
        preferredContentSize = CGSize(width: 414, height: 700)
        
        
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
