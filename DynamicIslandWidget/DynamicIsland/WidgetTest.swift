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
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    dynamicIslandExpandedLeadingView(
                        color: ColorMessage(rawValue: context.state.stateCode)?.messageColor ?? .white
                    )
                }
                DynamicIslandExpandedRegion(.trailing) {
                    dynamicIslandExpandedTrailingView()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    dynamicIslandExpandedBottomView()
                }
            } compactLeading: {
                compactLeadingView()
            } compactTrailing: {
                compactTrailingView()
            } minimal: {
                minimalView()
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

// MARK: - Private Methods

fileprivate extension VPNStatusWidget {

    //MARK: Expanded Views

    func dynamicIslandExpandedLeadingView(color: Color) -> some View {
        Circle()
            .stroke(
                style: StrokeStyle(
                    lineWidth: 2,
                    dash: [2]
                )
            )
            .colorMultiply(color) // условие цвета
            .padding(1)
            .overlay(
                Image("viZoneIcon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .colorMultiply(color)
            )
            .padding(0.1)
    }

    func dynamicIslandExpandedTrailingView() -> some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Tasks")
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

    func compactLeadingView() -> some View {
        HStack(alignment: .center) {

            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(
                    lineWidth: 1.5,
                    dash: [2]
                ))
                .frame(width: 10)
                .colorMultiply(.green)
                .fixedSize()

            //                    Text("121")
            //                        .frame(width: 22, height: 22)
            //                        .font(.system(size: 10).bold())
            //                        .scaledToFill()
            //                        .minimumScaleFactor(0.2)
            //                        .lineLimit(1)

        }
    }

    func compactTrailingView() -> some View {
        HStack(alignment: .center) {
            VStack {
                Text("Update")
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

    func minimalView() -> some View {
        NavigationLink(destination: EmptyView()) {
            ZStack {
                Image("viZoneIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .colorMultiply(.green)
            }
        }
    }
}
