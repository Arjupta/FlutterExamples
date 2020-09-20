import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);
  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
  // String result = 'task 2 data';
  // print('Task 2 complete');
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete' + task2Data);

  String myMargin = 'abc';
  double myMarginAsDouble;

  //It will catch the error by parsing
  try {
    myMarginAsDouble = double.parse(myMargin);
  } catch (e) {
    print(e);
    try {
      throw "This is custom exception";
    } catch (e) {
      print(e);
    }
  }

  //Null aware operator
  myMarginAsDouble = myMarginAsDouble ?? 30.0;
}
