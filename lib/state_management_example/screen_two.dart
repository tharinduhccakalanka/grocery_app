import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/state_management_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({
    super.key,

    //required this.counter
  });

  // final int counter;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  //int _counter = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              "Screen Two",
              fontSize: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Add +",
                onTap: () {
                  // setState(
                  //  () {
                  //  _counter++;
                  //isLoading = true;
                  // });
                  Provider.of<CounterProvider>(context, listen: false)
                      .increaseCounter(); //
                }),
            const SizedBox(height: 20),
            isLoading ? const CircularProgressIndicator() : Container(),
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return CustomText(
                  value.counter.toString(),
                  fontSize: 30,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Sub -",
                onTap: () {
                  // setState(
                  //() {
                  //  // _counter--;
                  //  //isLoading = false;
                  //});
                  Provider.of<CounterProvider>(context, listen: false)
                      .decreaseCounter();
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Go Back",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
