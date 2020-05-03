import 'package:surveyapp/services/networking.dart';

import 'constants.dart' show surveyAppUrl;

class Questions {
  Future getQuestions(int hospitalId) async {
    String requestUrl = '$surveyAppUrl/hospitals/$hospitalId/questions';
    NetworkHelper networkHelper = NetworkHelper(requestUrl);
    var questions = await networkHelper.getData();
    return questions;
  }

  Future postResponse(responseDict) async {
    String requestUrl = '$surveyAppUrl/responses';
    NetworkHelper networkHelper = NetworkHelper(
      requestUrl,
      responseData: responseDict,
    );
    await networkHelper.postData();

  }
}
