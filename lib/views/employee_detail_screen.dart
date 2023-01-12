import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    var employeename = Get.arguments;
    print(employeename);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getDetails(employeename['name']);
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details Of Employee'),
      ),
      body: GetBuilder<MainController>(
        builder: (controller) {
          return controller.employeeDetails.isEmpty
              ? Text('')
              : Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        // child: ( ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Name:   :${controller.employeeDetails['name']}  ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description  :  ${controller.employeeDetails['employeeDescription']}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price : ${controller.employeeDetails['price']} ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
