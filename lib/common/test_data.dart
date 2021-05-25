import 'package:show_tv/core/models/test_model.dart';
import 'package:get/get.dart';

class TestData {
  static final List<AnswerModel> answers = [
    AnswerModel(
      id: 0,
      answer: '-3',
      num: -3,
    ),
    AnswerModel(
      id: 1,
      answer: '-2',
      num: -2,
    ),
    AnswerModel(
      id: 2,
      answer: '-1',
      num: -1,
    ),
    AnswerModel(
      id: 3,
      answer: '1',
      num: 1,
    ),
    AnswerModel(
      id: 4,
      answer: '2',
      num: 2,
    ),
    AnswerModel(
      id: 5,
      answer: '3',
      num: 3,
    ),
  ];

  static final List<QuestionModel> questions = [
    QuestionModel(
      id: 0,
      question: 'Для меня как отрицательные, так и положительные эмоции служат источником знания о том, как поступать в жизни.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 1,
      question: 'Отрицательные эмоции помогают мне понять, что я должен изменить в моей жизни.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 2,
      question: 'Я спокоен, когда испытываю давление со стороны.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 3,
      question: 'Я способен наблюдать изменение своих чувств.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 4,
      question: 'Когда необходимо, я могу быть спокойным и сосредоточенным, чтобы действовать в соответствии с запросами жизни.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 5,
      question: 'Когда необходимо, я могу вызвать у себя широкий спектр положительных эмоций, такие, как веселье, радость, внутренний подъем и юмор.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 6,
      question: 'Я слежу за тем, как я себя чувствую.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 7,
      question: 'После того как что-то расстроило меня, я могу легко совладать со своими чувствами.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 8,
      question: 'Я способен выслушивать проблемы других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 9,
      question: 'Я не зацикливаюсь на отрицательных эмоциях.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 10,
      question: 'Я чувствителен к эмоциональным потребностям других.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 11,
      question: 'Я могу действовать успокаивающе на других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 12,
      question: 'Я могу заставить себя снова и снова встать перед лицом препятствия.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 13,
      question: 'Я стараюсь подходить творчески к жизненным проблемам.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 14,
      question: 'Я адекватно реагирую на настроения, побуждения и желания других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 15,
      question: 'Я могу легко входить в состояние спокойствия, готовности и сосредоточенности.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 16,
      question: 'Когда позволяет время, я обращаюсь к своим негативным чувствам и разбираюсь, в чем проблема.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 17,
      question: 'Я способен быстро успокоиться после неожиданного огорчения.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 18,
      question: 'Знание моих истинных чувств важно для поддержания «хорошей формы».',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 19,
      question: 'Я хорошо понимаю эмоции других людей, даже если они не выражены открыто.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 20,
      question: 'Я хорошо могу распознавать эмоции по выражению лица.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 21,
      question: 'Я могу легко отбросить негативные чувства, когда необходимо действовать.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 22,
      question: 'Я хорошо улавливаю знаки в общении, которые указывают на то, в чем другие нуждаются.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 23,
      question: 'Люди считают меня хорошим знатоком переживаний других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 24,
      question: 'Люди, осознающие свои истинные чувства, лучше управляют своей жизнью.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 25,
      question: 'Я способен улучшить настроение других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 26,
      question: 'Со мной можно посоветоваться по вопросам отношений между людьми.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 27,
      question: 'Я хорошо настраиваюсь на эмоции других людей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 28,
      question: 'Я помогаю другим использовать их побуждения для достижения личных целей.',
      answers: answers,
      result: 100.obs,
    ),
    QuestionModel(
      id: 29,
      question: 'Я могу легко отключиться от переживания неприятностей.',
      answers: answers,
      result: 100.obs,
    ),
  ];
}