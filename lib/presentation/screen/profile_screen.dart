// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:share_quiz/domain/use_cases/profile_use_case.dart';
import 'package:share_quiz/presentation/utility/widget_utils.dart';
import '../../data/repository_impl/profile_repository_impl.dart';
import '../../domain/models/user/user_data.dart';
import '../../domain/repository/profile_repository.dart';

final _profileRepositoryProvider =
    Provider.autoDispose<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});

final _profileUseCaseProvider = FutureProvider.autoDispose<UserData>((ref) {
  var repository = ref.read(_profileRepositoryProvider);
  return ProfileUseCase(repository).fetch();
});

class ProfileScreen extends HookConsumerWidget {

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profile = ref.watch(_profileUseCaseProvider);
    Widget profileWidget = profile.when<Widget>(
      data: (user) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // アバター表示
              CircleAvatar(
                radius: 50.0,
                backgroundImage:
                NetworkImage(user.photoUrl ?? ""),
              ),
              SizedBox(height: 10.0),
              // ユーザー名表示
              Text(
                user.name ?? "",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      error: (object, stackTrace) => Center(
        child: Text('エラーが発生しました'),
      ),
      loading: () => WidgetUtils.loading(),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // 背景色や背景画像などを設定できます
                  Container(color: Colors.blue),
                  profileWidget
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text('Item $index'));
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
