import 'package:surveyapp/services/networking.dart';

import 'constants.dart' show surveyAppUrl;


class Questions {
  Future getQuestions(int hospitalId) async {
    String requestUrl = '$surveyAppUrl/$hospitalId/questions';
    NetworkHelper networkHelper = NetworkHelper(requestUrl);
    var questions = await networkHelper.getData();
    return questions;
  }
}