import 'package:get/get.dart';


import '../models/employee_model.dart';
import '../services/services.dart';
import 'comman_dailog.dart';

class MainController extends GetxController {
  List<Employee> employeeData = [];
  Map employeeDetails = {}.obs;

  @override
  void onReady() {
    super.onReady();
    fatchEmployeeData();
  }

  Future<void> fatchEmployeeData() async {
    final List<Employee> loadedEmployee = [];
    CommanDialog.showLoading();
    try {
      final response = await APICall().getRequest('/getemployeelist');
      CommanDialog.hideLoading();
      if (response['code'] == 200) {
        response['message']['employee'].forEach(
          (employeeData) {
            loadedEmployee.add(
              Employee(
                  number: employeeData['number'],
                  name: employeeData['name'],
                  email: employeeData['email'],
                  password: employeeData['password'],
                  gender: employeeData['gender'],
                  age:int.parse(employeeData['age'])),
            );
          },
        );
        employeeData.assignAll(loadedEmployee);
        update();
      } else if (response['code'] == 400) {
      } else {}
    } catch (error) {
      CommanDialog.hideLoading();
      CommanDialog.showErrorDialog();
      print("ERROR11 $error");
    }
  }

  Future<void> getDetails(name) async {
    print("fatchEmployee $name");
    var postData = {"name": name};
    employeeDetails = {};

    try {
      CommanDialog.showLoading();
      final response =
          await APICall().postRequest('/getemployeedetails', postData);
      CommanDialog.hideLoading();
      if (response['code'] == 200) {
        print("Got employee");
        Map dta = response['message']['employeedet'];

        employeeDetails.addAll(dta);
        update();
      } else if (response['code'] == 400) {
        print("${response['code']}");
      } else {}
    } catch (error) {
      CommanDialog.hideLoading();
      print("ERROR11 $error");
    }
  }

}




