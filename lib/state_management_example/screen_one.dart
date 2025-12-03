import 'package:flutter/material.dart';
import 'package:grocery_app_1/components/custom_button.dart';
import 'package:grocery_app_1/components/custom_text.dart';
import 'package:grocery_app_1/state_management_example/providers/counter_provider.dart';
import 'package:grocery_app_1/state_management_example/screen_two.dart';
import 'package:grocery_app_1/utils/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              "Screen One",
              fontSize: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Add +",
                onTap: () {
                  // setState(
                  // () {
                  //  //_counter++;
                  //  //isLoading = true;
                  //});
                  Provider.of<CounterProvider>(context, listen: false)
                      .increaseCounter();
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
                  //setState(() {
                  // _counter--;
                  //isLoading = false;
                  //});
                  Provider.of<CounterProvider>(context, listen: false)
                      .decreaseCounter();
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Go Next",
              onTap: () {
                Helpers.navigateTo(context, const ScreenTwo());
              },
            ),
          ],
        ),
      ),
    );
  }
}
