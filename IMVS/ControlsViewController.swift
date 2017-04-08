//
//  ControlsViewController.swift
//  IMVS
//
//  Created by Allistair Crossley on 06/09/2014.
//  Copyright (c) 2014 Allistair Crossley. All rights reserved.
//

import UIKit

final class ControlsViewController: UIViewController {
    
    func getMoleculeViewController() -> MoleculeViewController {
        let nc = (self.presentingViewController as! UINavigationController)
        return nc.viewControllers[1] as! MoleculeViewController
    }
    
    func finish() {
        getMoleculeViewController().stateChanged()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modeBalls(_ sender: AnyObject) {

        getMoleculeViewController().state.mode = RenderModeEnumeration.balls
        finish()
    }
    
    @IBAction func modeSticks(_ sender: AnyObject) {
        
        getMoleculeViewController().state.mode = RenderModeEnumeration.sticks
        finish()
    }
    
    @IBAction func colourCPK(_ sender: AnyObject) {
        
        getMoleculeViewController().state.colour = RenderColourEnumeration.cpk
        finish()
    }
    
    @IBAction func colourAmino(_ sender: AnyObject) {
        
        getMoleculeViewController().state.colour = RenderColourEnumeration.amino
        finish()
    }
}
