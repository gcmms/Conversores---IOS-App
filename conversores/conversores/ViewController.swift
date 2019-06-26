//
//  ViewController.swift
//  conversores
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 25/06/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfValor: UITextField!
    
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var lbResultadoUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showNext(_ sender: UIButton) {
        var lbText = lbUnit.text!
        //var bt1    = btUnit1
        //var bt2    = btUnit2
        switch lbText {
        case "Temperatura":
            lbText = "Peso"
            btUnit1.setTitle("Kilograma", for: .normal)
            btUnit1.setTitle("Libra", for: .normal)
        case "Peso":
            lbText = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit1.setTitle("Dolar", for: .normal)
        case "Moeda":
            lbText = "Distancia"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit1.setTitle("Kilometro", for: .normal)
        default:
            lbText = "Temperatura"
            btUnit1.setTitle("Celcius", for: .normal)
            btUnit1.setTitle("Farenheint", for: .normal)
        
        }
        converter(nil)
    }
    
    @IBAction func converter(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        let lbText = lbUnit.text!
        switch lbText {
        case "Temperatura":
            calcTemperatura()
        case "Peso":
            calcPeso()
        case "Moeda":
            calcMoeda()
        default:
            calcDistancia()
            
        }
    }
    
    func calcTemperatura(){
        guard let temperatura = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Farenheit"
            lbResultado.text = String(temperatura * 1.8 + 32.0)
        } else {
            lbResultadoUnit.text = "Celcius"
            lbResultado.text = String((temperatura - 32 ) / 1.8)
        }
    }
    
    func calcPeso(){
        guard let peso = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Libra"
            lbResultado.text = String(peso / 2.2046)
        } else {
            lbResultadoUnit.text = "Kilograma"
            lbResultado.text = String(peso * 2.2046)
        }
        
    }
    
    func calcMoeda(){
        guard let moeda = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Dolar"
            lbResultado.text = String(moeda * 3.5)
        } else {
            lbResultadoUnit.text = "Real"
            lbResultado.text = String(moeda / 3.5)
        }
    }
    
    func calcDistancia(){
        guard let distancia = Double(tfValor.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultadoUnit.text = "Kilometro"
            lbResultado.text = String(distancia / 1000.0)
        } else {
            lbResultadoUnit.text = "Metros"
            lbResultado.text = String(distancia * 1000.0)
        }
    }
}

