//
//  CalendarView.swift
//  PetShop
//
//  Created by OLIVER LIAO on 2024/3/5.
//

import SwiftUI
import MijickCalendarView


struct СustomDayView: DayView {
    let date: Date
    let isCurrentMonth: Bool
    let selectedDate: Binding<Date?>?
    let selectedRange: Binding<MDateRange?>?
}

extension СustomDayView {
    func createDayLabel() -> AnyView {
        ZStack {
            createBackgroundView()
            createDayLabelText()
        }
        .erased() // cast to AnyView
    }
 }

private extension СustomDayView {
   func createBackgroundView() -> some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(Color.orange)
    }

  func createDayLabelText() -> some View {
        Text(getStringFromDay(format: "d"))
            .font(.system(size: 17))
            .foregroundColor(.white)
    }
}

struct CalendarView: View {
    
    @State private var selectedDate: Date? = nil
    @State private var selectedRange: MDateRange? = .init()
    var body: some View {
        VStack {
            MCalendarView(selectedDate: $selectedDate, selectedRange: $selectedRange, configBuilder: configureCalendar)
        }
        .padding(.all)
    }
}

extension CalendarView {
    func configureCalendar(_ config: CalendarConfig) -> CalendarConfig {
        config
            .daysVerticalSpacing(20)
            .daysHorizontalSpacing(20)
            .monthsTopPadding(40)
            .firstWeekday(.sunday)
    }
}


#Preview {
    CalendarView()
}
