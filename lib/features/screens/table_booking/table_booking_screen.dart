import 'package:cafe_management_system/core/controllers/dashscreen/table/table_controller.dart';
import 'package:cafe_management_system/core/utils/constants/colors.dart';
import 'package:cafe_management_system/core/utils/constants/enums.dart';
import 'package:cafe_management_system/core/utils/constants/icon_paths.dart';
import 'package:cafe_management_system/core/widgets/custom/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TableBookingScreen extends StatelessWidget {
  static const String routeName = "/table-booking-screen";
  final c = Get.find<TableController>();
  TableBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TableBooking"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(() {
                if (c.pageState.value == PageState.LOADING) {
                  return Center(
                    child: LinearProgressIndicator(),
                  );
                } else if (c.pageState.value == PageState.EMPTY) {
                  return Center(
                    child: Text("Empty"),
                  );
                } else if (c.pageState.value == PageState.NORMAL) {
                  return SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 20, // spacing between rows
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.9 // spacing between columns
                              ),
                      itemCount: c.tableList.length,
                      itemBuilder: (context, index) {
                        var table = c.tableList[index];
                        return GestureDetector(
                          onTap: () {
                            if (table.status != 0) {
                              SkySnackBar.error(
                                  title: "Table Booking",
                                  message:
                                      "${table.name} has been already reserved.");
                            } else {
                              c.table.value = table;
                              DatePickerBdaya.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2050, 12, 12),
                                onChanged: (date) {
                                  print('change $date');
                                  c.pickedDate.value = date.toString();
                                  c.splitDateTime(date);
                                },
                                onConfirm: (date) {
                                  print('confirm $date');
                                  c.guestNumber.value = 1;
                                  c.splitDateTime(date);

                                  c.openReservationBottomSheet(table);
                                  // Here you can handle the selected date and time
                                },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en,
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: table.status == 0
                                      ? AppColors.green
                                      : AppColors.redColor,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(IconPath.tableBooking),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(table.name ?? "Table A")
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Error View"),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
