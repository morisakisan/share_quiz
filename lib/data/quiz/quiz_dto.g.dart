// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizDtoImpl _$$QuizDtoImplFromJson(Map<String, dynamic> json) =>
    _$QuizDtoImpl(
      docId: json['docId'] as String?,
      correctAnswer: json['correct_answer'] as int,
      title: json['title'] as String,
      question: json['question'] as String,
      imageUrl: json['image_url'] as String?,
      choices:
          (json['choices'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
      uid: json['uid'] as String,
      correctAnswerRate: (json['correct_answer_rate'] as num?)?.toDouble(),
      answerCount: json['answer_count'] as int?,
      goodCount: json['good_count'] as int?,
    );

Map<String, dynamic> _$$QuizDtoImplToJson(_$QuizDtoImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'correct_answer': instance.correctAnswer,
      'title': instance.title,
      'question': instance.question,
      'image_url': instance.imageUrl,
      'choices': instance.choices,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'uid': instance.uid,
      'correct_answer_rate': instance.correctAnswerRate,
      'answer_count': instance.answerCount,
      'good_count': instance.goodCount,
    };
