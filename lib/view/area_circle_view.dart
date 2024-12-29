import 'package:class_assignment_2/bloc/area_circle_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleView extends StatefulWidget {
  const AreaCircleView({super.key});

  @override
  State<AreaCircleView> createState() => _AreaCircleViewState();
}

class _AreaCircleViewState extends State<AreaCircleView> {
  final _radiusController = TextEditingController();
  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area Of Circle Bloc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Area of Circle with radius  ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: _radiusController,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                BlocBuilder<AreaCircleBloc, double>(
                  builder: (context, state) {
                    return Text(
                      "  is:  ${state.toStringAsFixed(4)}",
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      final radius =
                          double.tryParse(_radiusController.text) ?? 0;
                      context
                          .read<AreaCircleBloc>()
                          .add(CalculateEvent(radius));
                    },
                    child: Text("Calculate"))),
          ],
        ),
      ),
    );
  }
}
