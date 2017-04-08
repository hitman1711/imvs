//
//  PDBLoader.swift
//  IMVS
//
//  Created by Allistair Crossley on 06/07/2014.
//  Copyright (c) 2014 Allistair Crossley. All rights reserved.
//

import Foundation

final class PDBLoader {
    
    var molecule = Molecule()
    
    func loadMoleculeForPath(_ pdbFile: String) {
        
        let path = Bundle.main.path(forResource: pdbFile, ofType: "pdb")
        molecule.name = pdbFile
        
        let content = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        let lines = content!.components(separatedBy: CharacterSet.newlines)
       
        for line in lines {
            readHEADERWithLine(line)
            readATOMWithLine(line)
        }
        
        molecule.commit()
    }
    
    func getDataForColumnsInLine(_ line: String, from: Int, to: Int) -> String {
        let tmp = (line as NSString).substring(from: from - 1)
        return (tmp as NSString).substring(to: to - from + 1).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func isRecordTypeEqualTo(_ to: String, line: String) -> Bool {
        
        if line.isEmpty || line.characters.count < 6 {
            return false
        }
        
        return getDataForColumnsInLine(line, from: 1, to: 6) == to
    }

    func readHEADERWithLine(_ line: String) {
        
        if isRecordTypeEqualTo("HEADER", line: line) {
            // molecule.name = getDataForColumnsInLine(line, from: 11, to: 50)
        }
    }
    
    func readATOMWithLine(_ line: String) {
        
        if isRecordTypeEqualTo("ATOM", line: line) {
            
            let id = getDataForColumnsInLine(line, from: 7, to: 11)
            
            let name = getDataForColumnsInLine(line, from: 13, to: 16)
            let element = getDataForColumnsInLine(line, from: 13, to: 14)
            let remoteness = getDataForColumnsInLine(line, from: 15, to: 15)
            
            let residue = getDataForColumnsInLine(line, from: 18, to: 20)
            let chain = getDataForColumnsInLine(line, from: 22, to: 22)

            let x = (getDataForColumnsInLine(line, from: 31, to: 38) as NSString).floatValue
            let y = (getDataForColumnsInLine(line, from: 39, to: 46) as NSString).floatValue
            let z = (getDataForColumnsInLine(line, from: 47, to: 54) as NSString).floatValue
            
            let atom = Atom(id: id, name: name, residue: residue, chain: chain, element: element, x: x, y: y, z: z, remoteness: remoteness)
            
            molecule.addAtom(atom)
        }
    }
}
