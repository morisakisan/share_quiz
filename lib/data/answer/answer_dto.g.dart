// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerDtoImpl _$$AnswerDtoImplFromJson(Map<String, dynamic> json) =>
    _$AnswerDtoImpl(
      answer: json['answer'] as int,
      userId: json['user_id'] as String,
      quizId: json['quiz_id'] as String,
      selectedChoiceIndex: json['selected_choice_index'] as int,
      isCorrect: json['is_correct'] as bool,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    );

Map<String, dynamic> _$$AnswerDtoImplToJson(_$AnswerDtoImpl instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'user_id': instance.userId,
      'quiz_id': instance.quizId,
      'selected_choice_index': instance.selectedChoiceIndex,
      'is_correct': instance.isCorrect,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
    };
