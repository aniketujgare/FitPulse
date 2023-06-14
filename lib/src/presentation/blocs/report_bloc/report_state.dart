part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoadedState extends ReportState {
  final ReportModel reportModel;

  const ReportLoadedState({required this.reportModel});
}
