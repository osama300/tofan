import 'package:flutter/material.dart';
import 'package:tofan/app/quiz/data/insert/list_quiz.dart';
import 'package:tofan/app/quiz/view/quick_quiz_view.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuizIndex = 0;
  final Map<int, int> userAnswers = {};

  int _prepareQuizResult() {
    int correctAnswers = 0;
    for (int i = 0; i < quizData.length; i++) {
      final givenAnswer = userAnswers[i] ?? 0;
      if (givenAnswer == quizData[i].correctOption) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  void _showResultSnackbar(BuildContext context, int correctAnswers) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('حققت: $correctAnswers'),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuizIndex = 0;
      userAnswers.clear();
    });
  }

  void _handleNextPressed() {
    if (currentQuizIndex == quizData.length - 1) {
      final correctAnsweres = _prepareQuizResult();
      _showResultSnackbar(context, correctAnsweres);
    } else {
      setState(() {
        currentQuizIndex++;
      });
    }
  }

  bool _canNavigateToPrevious() {
    return currentQuizIndex > 0 && currentQuizIndex < quizData.length - 1;
  }

  void _handlePreviousPressed() {
    setState(() {
      currentQuizIndex--;
    });
  }

  void _handleOptionSelected(int value) {
    userAnswers[currentQuizIndex] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اسئلة"),
        automaticallyImplyLeading: true,
      ),
      body: QuickQuizView(
        title: quizData[currentQuizIndex].title,
        option1: quizData[currentQuizIndex].option1,
        option2: quizData[currentQuizIndex].option2,
        option3: quizData[currentQuizIndex].option3,
        option4: quizData[currentQuizIndex].option4,
        onNextPressed: () => _handleNextPressed(),
        onPreviousPressed:
        _canNavigateToPrevious() ? () => _handlePreviousPressed() : null,
        onOptionSelected: (value) => _handleOptionSelected(value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetQuiz,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
