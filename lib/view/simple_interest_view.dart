import 'package:class_assignment_2/bloc/simple_interest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  final _principalController = TextEditingController();
  final _timeController = TextEditingController();
  final _rateController = TextEditingController();

  @override
  void dispose() {
    _principalController.dispose();
    _rateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Bloc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _principalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Principal",
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Time in years",
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _rateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Rate",
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
            ),
            const SizedBox(height: 24),
            BlocBuilder<SimpleInterestBloc, double>(
              builder: (context, state) {
                return Text(
                  "Simple Interest: $state",
                  style: TextStyle(fontSize: 22),
                );
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      double principal =
                          double.tryParse(_principalController.text) ?? 0;
                      double time = double.tryParse(_timeController.text) ?? 0;
                      double rate = double.tryParse(_rateController.text) ?? 0;

                      context
                          .read<SimpleInterestBloc>()
                          .add(CalculateEvent(principal, time, rate));
                    },
                    child: Text("Calculate"))),
          ],
        ),
      ),
    );
  }
}
