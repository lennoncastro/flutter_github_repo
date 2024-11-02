import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.getInitialReposByName(String name) =
      GetInitialReposByName;

  const factory SearchEvent.getMoreRepos() = GetMoreRepos;
}
