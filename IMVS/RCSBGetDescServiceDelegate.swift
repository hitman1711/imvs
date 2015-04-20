//
//  RCSBGetDescServiceDelegate.swift
//  IMVS
//
//  Created by Allistair Crossley on 20/04/2015.
//  Copyright (c) 2015 Allistair Crossley. All rights reserved.
//

import Foundation

/**
 * Functions required for being an RCSBSearchService delegate.
 */
protocol RCSBGetDescServiceDelegate {
    
    func setMolecule(molSumm: MoleculeSummary)
}