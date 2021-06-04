// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizDto _$_$_QuizDtoFromJson(Map<String, dynamic> json) {
  return _$_QuizDto(
    correctAnswer: json['correct_answer'] as int,
    title: json['title'] as String,
    question: json['question'] as String,
    imageUrl: json['image_url'] as String,
    choices:
        (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
    createdAt:
        const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    userId: json['user_id'] as String,
    car: (json['correct_answer_rate'] as num?)?.toDouble(),
    answerCount: json['answer_count'] as int?,
  );
}

Map<String, dynamic> _$_$_QuizDtoToJson(_$_QuizDto instance) =>
    <String, dynamic>{
      'correct_answer': instance.correctAnswer,
      'title': instance.title,
      'question': instance.question,
      'image_url': instance.imageUrl,
      'choices': instance.choices,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'user_id': instance.userId,
      'correct_answer_rate': instance.car,
      'answer_count': instance.answerCount,
    };
