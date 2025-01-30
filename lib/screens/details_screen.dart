import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sca_ui_imp/screens/onboarding.dart';
import 'package:sca_ui_imp/shared/app_colors.dart';
import 'package:sca_ui_imp/shared/assets.dart';
import 'package:table_calendar/table_calendar.dart';

import 'home_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DateTime _focusedDay = DateTime.now().add(const Duration(days: 1));
  DateTime _selectedDay = DateTime.now().add(const Duration(minutes: 30));

  // flutter: Day being returned is 2025-01-30 14:39:58.553263
  // flutter: Day being returned is 2025-01-30 00:00:00.000Z

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      bottomSheet: SafeArea(
        child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 40),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                text: "Book Now",
              )
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appColor,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        actions: [
          SvgPicture.asset(AppAssets.notificationIcon),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Date",
                        style: style.copyWith(
                          color: AppColors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.calenderIcon),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            DateFormat("MMM yyyy").format(_selectedDay),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TableCalendar(
                    rowHeight: 33,
                    daysOfWeekHeight: 30,
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (_, d) {
                        return Container(
                          decoration: isSameDay(d, _selectedDay)
                              ? const BoxDecoration(
                                  color: AppColors.black,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ))
                              : null,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Center(
                                child: Text(
                                  DateFormat("EE").format(d),
                                  style: style.copyWith(
                                      color: AppColors.white,
                                      fontSize: 14,
                                      fontWeight: isSameDay(d, _selectedDay)
                                          ? FontWeight.w700
                                          : null),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      withinRangeBuilder: (_, d, dd) {
                        return Center(
                          child: Text(
                            d.day.toString(),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      defaultBuilder: (_, d, dd) {
                        return Center(
                          child: Text(
                            d.day.toString(),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      disabledBuilder: (_, d, dd) {
                        return Center(
                          child: Text(
                            d.day.toString(),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      outsideBuilder: (_, d, dd) {
                        return Center(
                          child: Text(
                            d.day.toString(),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                      todayBuilder: (_, d, dd) {
                        return Center(
                          child: Text(
                            d.day.toString(),
                            style: style.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                      selectedBuilder: (_, d, dd) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              )),
                          child: Center(
                            child: Text(
                              d.day.toString(),
                              style: style.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        );
                      },
                    ),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerVisible: false,
                    firstDay: now,
                    lastDay: now.add(const Duration(days: (30 * 6))),
                    focusedDay: _focusedDay,
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      imageBuilder(
                        url:
                            "https://unsplash.com/photos/0g4OCfUAhuY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NHx8Z3JlZW50b3dufGVufDB8fHx8MTczODE1NzUzMXww&force=true&w=2400",
                        borderRadius: 35,
                        height: 343,
                        width: 343,
                        key: widget.key ?? const ValueKey("product_img_0"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "876 Green town",
                                style: style.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Rosaville",
                                style: style.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyText),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.yellowStarIcon),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                "4.9",
                                style: style.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "6391 Elgin St. Celina,Delaware 10299876 Green town,Rosaville Is the perfect peacful location for those who loves to spend his time with nature and love the fresh air",
                        style: style.copyWith(
                          fontSize: 16,
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
