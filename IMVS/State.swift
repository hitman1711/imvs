//
//  State.swift
//  IMVS
//
//  Created by Allistair Crossley on 06/09/2014.
//  Copyright (c) 2014 Allistair Crossley. All rights reserved.
//

import Foundation

enum RenderModeEnumeration {

    case balls
    case sticks
}

enum RenderColourEnumeration {
    
    case cpk
    case amino
}

final class State {
    
    var mode: RenderModeEnumeration = RenderModeEnumeration.balls
    var colour: RenderColourEnumeration = RenderColourEnumeration.cpk
}
