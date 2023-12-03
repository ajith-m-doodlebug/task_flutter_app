import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_urbanmatch/Classes/commit_class.dart';
import 'package:task_urbanmatch/api/get_commits_api.dart';

part 'get_commits_event.dart';
part 'get_commits_state.dart';

class GetCommitsBloc extends Bloc<GetCommitsEvent, GetCommitsState> {
  GetCommitsBloc() : super(GetCommitsInitial()) {
    on<GetCommitsEvent>((event, emit) {});

    on<CommitsDataFetchEvent>((event, emit) async {
      emit.call(CommitsDataLoadingState());

      try {
        List<CommitClass> response =
            await getCommitsAPI(login: event.login, name: event.name);

        if (response.isNotEmpty) {
          emit.call(CommitsDataRetreivedState(commitsData: response));
        } else {
          emit.call(CommitsDataErrorState());
        }
      } catch (e) {
        emit.call(CommitsDataErrorState());
      }
    });
  }
}
