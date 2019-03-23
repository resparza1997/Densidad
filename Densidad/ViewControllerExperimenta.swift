//
//  ViewControllerExperimenta.swift
//  Densidad
//
//  Created by Rodrigo Esparza on 3/23/19.
//  Copyright © 2019 Rodrigo Esparza. All rights reserved.
//

import UIKit

class ViewControllerExperimenta: UIViewController {

    @IBOutlet weak var vistaOpacidad: UIView!
    @IBOutlet weak var gifLiquido: UIImageView!
    
    private lazy var waveView: LCWaveView = {
        let waveView = LCWaveView(frame: CGRect(x: 0, y: 0, width: vistaOpacidad.bounds.size.width , height: 0 ), color: UIColor.black)
        waveView.waveRate = 2
        waveView.waveSpeed = 1
        waveView.waveHeight = 7
        return waveView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gifLiquido.loadGif(name: "agua fondo")
        
        waveView.startWave()
        vistaOpacidad.addSubview(waveView)
        
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
