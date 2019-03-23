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
    @IBOutlet weak var gramos1: UITextField!
    @IBOutlet weak var gramos2: UITextField!
    @IBOutlet weak var volumen1: UITextField!
    @IBOutlet weak var volumen2: UITextField!
    @IBOutlet weak var densidad1: UITextField!
    @IBOutlet weak var densidad2: UITextField!
    @IBOutlet weak var objeto1: UIView!
    @IBOutlet weak var objeto2: UIView!
    
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
    
    @IBAction func calculaDensidad(_ sender: Any) {
        if ( gramos1.text != "" && volumen1.text != "" ){
            let peso = Double(gramos1.text!)
            let volumen = Double(volumen1.text!)
            
            let densidad :Double = peso! / volumen!
            
            densidad1.text = String(densidad)
            
            if ( densidad > 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto1.frame.origin.y = 500
                }
            }
            
            if ( densidad < 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto1.frame.origin.y = 200
                }
            }
            if ( densidad == 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto1.frame.origin.y = 400
                }
            }
            
        }
        
        if ( gramos2.text != "" && volumen2.text != "" ){
            let peso = Double(gramos2.text!)
            let volumen = Double(volumen2.text!)
            
            let densidad :Double = peso! / volumen!
            
            densidad2.text = String(densidad)
            
            if ( densidad > 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto2.frame.origin.y = 500
                }
            }
            
            if ( densidad < 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto2.frame.origin.y = 200
                }
            }
            if ( densidad == 1  ){
                UIView.animate(withDuration: 0.5){
                    self.objeto2.frame.origin.y = 400
                }
            }
        }
        
        
    }
    

}
