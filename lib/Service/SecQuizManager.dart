import 'package:assingment3/Service/Option.dart';
import 'package:assingment3/Service/Question.dart';

class SecQuizManager {
  SecQuizManager() {
    _questions.add(Question("Which one is the past tense of 'fall' ?", [
      Option('fought', 0),
      Option('fell', 10),
      Option('fallen', 0),
      Option('felt', 0),
    ]));
    _questions.add(Question("Which one is the past tense of 'draw' ?", [
      Option('drew', 10),
      Option('drawn', 0),
      Option('droven', 0),
      Option('done', 0),
    ]));
    _questions.add(Question('Which one is different than the others?', [
      Option('Apple', 10),
      Option('Purple', 0),
      Option('White', 0),
      Option('Green', 0),
    ]));
    _questions
        .add(Question("Which one has the same meaning with 'homework' ?", [
      Option('Assingmet', 10),
      Option('Household', 0),
      Option('Housekeeper', 0),
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
    print('getCurrentQuestion $currentQuestionId');
    if (currentQuestionId < _questions.length) {
      return _questions[currentQuestionId];
    } else {
      return Question('', []);
    }
  }
}
