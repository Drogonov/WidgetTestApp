//
//  WidgetTest.swift
//  WidgetTestApp
//
//  Created by Anton Vlezko on 23.04.2023.
//

import ActivityKit
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
            let state = WidgetState(rawValue: context.state.stateCode) ?? .error

            // Lock screen/banner UI goes here
            return VStack {
                Text(state.message)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            let state = WidgetState(rawValue: context.state.stateCode) ?? .error

            return DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(state: state)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    dynamicIslandExpandedTrailingView(state: state)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    dynamicIslandExpandedBottomView()
                }
            } compactLeading: {
                compactLeadingView(state: state)
            } compactTrailing: {
                compactTrailingView(state: state)
            } minimal: {
                minimalView(state: state)
            }
            .keylineTint(Color.red)
            .widgetURL(URL(string: "http://www.apple.com"))
        }
    }
}

// MARK: - Private Methods

fileprivate extension VPNStatusWidget {

    //MARK: Expanded Views

    func dynamicIslandExpandedLeadingView(state: WidgetState) -> some View {
        Circle()
            .stroke(
                style: StrokeStyle(
                    lineWidth: 2,
                    dash: [2]
                )
            )
            .colorMultiply(state.messageColor) // условие цвета
            .padding(1)
            .overlay(
                Image("viZoneIcon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .colorMultiply(state.messageColor)
            )
            .padding(0.1)
    }

    func dynamicIslandExpandedTrailingView(state: WidgetState) -> some View {
        ZStack {
            VStack(spacing: 20) {
                Text(state.message)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
                    .scaledToFill()
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)

                Text("Update \(Text(Date(), style: .time))")
                    .font(.system(size: 15).uppercaseSmallCaps())
                    .scaledToFill()
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)
            }
        }
    }

    func dynamicIslandExpandedBottomView() -> some View {
        Image("viZoneIconWidget")
            .resizable()
            .fixedSize()
    }

    //MARK: Compact Views

    func compactLeadingView(state: WidgetState) -> some View {
        HStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(
                    lineWidth: 1.5,
                    dash: [2]
                ))
                .frame(width: 10)
                .colorMultiply(state.messageColor)
                .fixedSize()
        }
    }

    func compactTrailingView(state: WidgetState) -> some View {
        HStack(alignment: .center) {
            VStack {
                Text(state.message)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(.system(size: 12).bold())
                    .scaledToFill()
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)

                Text("\(Text(Date(), style: .time))")
                    .font(.system(size: 5).bold())
                    .scaledToFill()
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)
            }
        }
    }

    func minimalView(state: WidgetState) -> some View {
        NavigationLink(destination: EmptyView()) {
            ZStack {
                Image(state.message)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .colorMultiply(state.messageColor)
            }
        }
    }
}
