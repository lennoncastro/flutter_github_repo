sealed class SearchEvent {}

final class GetReposByName extends SearchEvent {
  GetReposByName(this.name);

  final String name;
}
