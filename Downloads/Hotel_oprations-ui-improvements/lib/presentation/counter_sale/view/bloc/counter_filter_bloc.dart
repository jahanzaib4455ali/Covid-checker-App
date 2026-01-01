import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class CounterFilterEvent extends Equatable {
  const CounterFilterEvent();
  @override
  List<Object?> get props => [];
}

class CounterSelectSort extends CounterFilterEvent {
  final int? index;
  const CounterSelectSort(this.index);
  @override
  List<Object?> get props => [index];
}

class CounterSelectVeg extends CounterFilterEvent {
  final int? index;
  const CounterSelectVeg(this.index);
  @override
  List<Object?> get props => [index];
}

class CounterSelectTopPick extends CounterFilterEvent {
  final int? index;
  const CounterSelectTopPick(this.index);
  @override
  List<Object?> get props => [index];
}

class CounterSelectDietary extends CounterFilterEvent {
  final int? index;
  const CounterSelectDietary(this.index);
  @override
  List<Object?> get props => [index];
}

class CounterClearAllFilters extends CounterFilterEvent {}

// State
class CounterFilterState extends Equatable {
  final int? selectedSortIndex;
  final int? selectedVegIndex;
  final int? selectedTopPickIndex;
  final int? selectedDietaryIndex;

  const CounterFilterState({
    this.selectedSortIndex,
    this.selectedVegIndex,
    this.selectedTopPickIndex,
    this.selectedDietaryIndex,
  });

  CounterFilterState copyWith({
    int? selectedSortIndex,
    int? selectedVegIndex,
    int? selectedTopPickIndex,
    int? selectedDietaryIndex,
  }) {
    return CounterFilterState(
      selectedSortIndex: selectedSortIndex ?? this.selectedSortIndex,
      selectedVegIndex: selectedVegIndex ?? this.selectedVegIndex,
      selectedTopPickIndex: selectedTopPickIndex ?? this.selectedTopPickIndex,
      selectedDietaryIndex: selectedDietaryIndex ?? this.selectedDietaryIndex,
    );
  }

  @override
  List<Object?> get props => [selectedSortIndex, selectedVegIndex, selectedTopPickIndex, selectedDietaryIndex];
}

// Bloc
class CounterFilterBloc extends Bloc<CounterFilterEvent, CounterFilterState> {
  CounterFilterBloc() : super(const CounterFilterState()) {
    on<CounterSelectSort>((event, emit) => emit(state.copyWith(selectedSortIndex: event.index)));
    on<CounterSelectVeg>((event, emit) => emit(state.copyWith(selectedVegIndex: event.index)));
    on<CounterSelectTopPick>((event, emit) => emit(state.copyWith(selectedTopPickIndex: event.index)));
    on<CounterSelectDietary>((event, emit) => emit(state.copyWith(selectedDietaryIndex: event.index)));
    on<CounterClearAllFilters>((event, emit) => emit(const CounterFilterState()));
  }
}
