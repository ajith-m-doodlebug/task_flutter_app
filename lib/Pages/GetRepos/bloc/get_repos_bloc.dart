import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_urbanmatch/Classes/repo_class.dart';
import 'package:task_urbanmatch/api/get_repos_api.dart';

part 'get_repos_event.dart';
part 'get_repos_state.dart';

class GetReposBloc extends Bloc<GetReposEvent, GetReposState> {
  GetReposBloc() : super(GetReposInitial()) {
    on<GetReposEvent>((event, emit) {});

    on<ReposDataFetchEvent>((event, emit) async {
      emit.call(ReposDataLoadingState());

      try {
        List<RepoClass> response = await getReposAPI(userName: event.userName);

        if (response.isNotEmpty) {
          emit.call(ReposDataRetreivedState(reposData: response));
        } else {
          emit.call(ReposDataErrorState());
        }
      } catch (e) {
        emit.call(ReposDataErrorState());
      }
    });
  }
}
