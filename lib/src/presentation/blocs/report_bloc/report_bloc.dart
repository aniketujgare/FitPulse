import 'package:equatable/equatable.dart';
import 'package:fitpulse/src/data/repositories/report_repository.dart';
import 'package:fitpulse/src/domain/models/report_model.dart';
import 'package:fitpulse/src/domain/models/workout_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository reportRepository;
  ReportBloc({required this.reportRepository}) : super(ReportInitial()) {
    on<GetReportEvent>((event, emit) async {
      emit(ReportLoading());
      var report = await reportRepository.fetchReport();
      emit(ReportLoadedState(reportModel: report));
    });
    on<AddExerciseToReportEvent>((event, emit) async {
      emit(ReportLoading());
      var report = await reportRepository.addDoneExercisse(event.workoutModel);
      emit(ReportLoadedState(reportModel: report));
    });
  }
}
