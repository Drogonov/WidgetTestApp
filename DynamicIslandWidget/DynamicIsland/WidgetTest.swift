//
//  WidgetTest.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import SwiftUI
import WidgetKit

//Target Membership for this file: Widget Exension

@main
struct WidgetTest: WidgetBundle {
    var body: some Widget {
        VPNStatusWidget()
    }
}

struct VPNStatusWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Attributes.self) { context in

            //you SHOULD definitely implement a widget for the lock screen to be able to use a dynamic island !

            LockScreenView(
                countryFlag: context.state.stateCode,
                countryName: context.state.stateCode
            )
        } dynamicIsland: { context in
            //view when big state dynamicIsland
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    DynamicIslandTopSegment(
                        countryFlag: context.state.stateCode,
                        countryName: context.state.stateCode
                    )
                }
                DynamicIslandExpandedRegion(.bottom) {
                    DynamicIslandButton()
                }
                //also you can use .leading and .trailing ExpandedRegion
            } compactLeading: {
                //left small view when small state dynamicIsland
                Text(context.state.stateCode)
                    .font(.system(size: 26))
            } compactTrailing: {
                //right small view when small state dynamic island
                VPNLogo(
                    text: "VPN",
                    fontSize: 11,
                    cornerRadius: 4
                )
                .padding(.leading, 2) //In real device camera overlaps the view, need padding
            } minimal: {
                //small view when work two apps which use dynamic island
                Text(context.state.stateCode)
                    .font(.system(size: 26))
            }
        }
    }
}

