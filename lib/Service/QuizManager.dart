import 'package:assingment3/Service/Option.dart';
import 'package:assingment3/Service/Question.dart';

class QuizManager {
  QuizManager() {
    _questions.add(Question('100 + 100 = ?', [
      Option('200', 10),
      Option('52', 0),
      Option('102', 0),
      Option('10000', 0),
    ]));
    _questions.add(Question('5 × 20 = ?', [
      Option('100', 10),
      Option('28', 0),
      Option('70', 0),
      Option('20', 0),
    ]));
    _questions.add(Question('(10 × 2) - 1 = ?', [
      Option('19', 10),
      Option('20', 0),
      Option('21', 0),
      Option('100', 0),
    ]));
    _questions.add(Question('200 ÷ 20 = ?', [
      Option('10', 10),
      Option('220', 0),
      Option('20', 0),
    ]));
    _questions.shuffle();
    for (var question in _questions) {
      question.options.shuffle();
    }
  }
  List<Question> _questions = [];
  void LoadQuestions() {}
  int _score = 0;
  int currentQuestionId = 0;
  void nextQuestion(score) {
    if (currentQuestionId < _questions.length) {
      _score += score;
      currentQuestionId++;
    }
    print(currentQuestionId);
  }

  int getTotalScore() => _score;
  int getCurrentPageId() => currentQuestionId + 1;
  int totalQuestionNumber() => _questions.length;

  bool isFinished() {
    return currentQuestionId >= _questions.length;
  }
  /*  if (currentQuestionId >= _questions.length - 1) {
      return true;
    }else{
      return false;
    }
  }*/

  Question getCurrentQuestion() {
    print('getCurrentQueestion $currentQuestionId');
    if (currentQuestionId < _questions.length) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
}
