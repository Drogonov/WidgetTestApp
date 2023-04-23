//
//  Attributes.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import Foundation
import ActivityKit

//Target Membership for this file: UIKit App + Widget Exension

@available(iOS 16.1, *)
struct Attributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable { //You can append your changable parameters in ContentState. And call it "context.state.YOUR_PARAMETER_NAME"
        var stateCode: String
    }

    //You can append not changable parametrs here. And call it "context.attributes.YOUR_PARAMETER_NAME"
}

