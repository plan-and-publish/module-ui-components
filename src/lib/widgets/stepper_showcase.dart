part of '../views/showcase.dart';

class _StepperShowcase extends StatelessWidget {
  const _StepperShowcase();

  @override
  Widget build(BuildContext context) {
    return Frame(
      title: 'Stepper',
      widgets: [
        SizedBox(child: _buildStepper()),
      ],
    );
  }

  Widget _buildStepper() {
    var value = 2;
    final textController = TextEditingController(text: value.toString());
    final mixValueTextController = TextEditingController(text: 'mix');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 132,
          child: PAPStepper(
            textController: textController,
            stepSize: 2,
            minimumValue: 1,
            maximumValue: 99,
            onChanged: (_) {},
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 132,
          child: PAPStepper.withVariousIncrementDecrementStep(
            textController: textController,
            incrementalStepSize: 1,
            decrementalStepSize: 1.5,
            minimumValue: 1,
            maximumValue: 99,
            fractionDigits: 1,
            onChanged: (_) {},
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 132,
          child: PAPStepper.withVariousIncrementDecrementStep(
            textController: mixValueTextController,
            incrementalStepSize: 1,
            decrementalStepSize: 1,
            minimumValue: 1,
            maximumValue: 99,
            fractionDigits: 1,
            onChanged: (_) {},
            allowedValues: const ['mix'],
          ),
        ),
      ],
    );
  }
}
