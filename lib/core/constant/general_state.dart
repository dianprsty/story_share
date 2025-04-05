enum GeneralState {
  initial,
  loading,
  success,
  error;


  bool get isInitial => this == GeneralState.initial;
  bool get isLoading => this == GeneralState.loading;
  bool get isSuccess => this == GeneralState.success;
  bool get isError => this == GeneralState.error;
}