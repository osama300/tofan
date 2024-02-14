import 'package:flutter/material.dart';

class QuickQuizView extends StatefulWidget {
  const QuickQuizView({
    Key? key,
    required this.onOptionSelected,
    required this.onNextPressed,
    required this.onPreviousPressed,
    required this.title,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  }) : super(key: key);

  final Function(int) onOptionSelected;
  final VoidCallback onNextPressed;
  final VoidCallback? onPreviousPressed;

  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;

  @override
  State<QuickQuizView> createState() => _QuickQuizViewState();
}

class _QuickQuizViewState extends State<QuickQuizView> {
  int? selectedOption;

  @override
  void didUpdateWidget(covariant QuickQuizView oldWidget) {
    super.didUpdateWidget(oldWidget);
    selectedOption = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(10),

      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold,

            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          buildRadioTile(1, widget.option1),
          buildRadioTile(2, widget.option2),
          buildRadioTile(3, widget.option3),
          buildRadioTile(4, widget.option4),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: widget.onPreviousPressed,
                child: const Text('السابق'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: widget.onNextPressed,
                child: const Text('التالي'),
              )
            ],
          )
        ],
      ),
    );
  }

  RadioListTile<int> buildRadioTile(int value, String title) {
    return RadioListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      value: value,
      groupValue: selectedOption,
      onChanged: (newValue) {
        setState(() {
          selectedOption = newValue;
          widget.onOptionSelected(newValue!);
        });
      },
    );
  }
}
