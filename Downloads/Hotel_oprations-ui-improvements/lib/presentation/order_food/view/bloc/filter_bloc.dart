import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class FilterEvent extends Equatable {
  const FilterEvent();
  @override
  List<Object?> get props => [];
}

class SelectSort extends FilterEvent {
  final int? index;
  const SelectSort(this.index);
  @override
  List<Object?> get props => [index];
}

class SelectVeg extends FilterEvent {
  final int? index;
  const SelectVeg(this.index);
  @override
  List<Object?> get props => [index];
}

class SelectTopPick extends FilterEvent {
  final int? index;
  const SelectTopPick(this.index);
  @override
  List<Object?> get props => [index];
}

class SelectDietary extends FilterEvent {
  final int? index;
  const SelectDietary(this.index);
  @override
  List<Object?> get props => [index];
}

class ClearAllFilters extends FilterEvent {}

// State
class FilterState extends Equatable {
  final int? selectedSortIndex;
  final int? selectedVegIndex;
  final int? selectedTopPickIndex;
  final int? selectedDietaryIndex;

  const FilterState({
    this.selectedSortIndex,
    this.selectedVegIndex,
    this.selectedTopPickIndex,
    this.selectedDietaryIndex,
  });

  FilterState copyWith({
    int? selectedSortIndex,
    int? selectedVegIndex,
    int? selectedTopPickIndex,
    int? selectedDietaryIndex,
  }) {
    return FilterState(
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
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<SelectSort>((event, emit) => emit(state.copyWith(selectedSortIndex: event.index)));
    on<SelectVeg>((event, emit) => emit(state.copyWith(selectedVegIndex: event.index)));
    on<SelectTopPick>((event, emit) => emit(state.copyWith(selectedTopPickIndex: event.index)));
    on<SelectDietary>((event, emit) => emit(state.copyWith(selectedDietaryIndex: event.index)));
    on<ClearAllFilters>((event, emit) => emit(const FilterState()));
  }
} 