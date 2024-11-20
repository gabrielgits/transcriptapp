sealed class ControllerState {
  final String message;

  ControllerState(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ControllerState &&
          runtimeType == other.runtimeType &&
          message == other.message;
  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return message;
  }
}

class ControllerStateLoading extends ControllerState {
  ControllerStateLoading([super.message = 'StateLoading']);
}

class ControllerStateLoaded extends ControllerState {
  ControllerStateLoaded([super.message = 'StateLoaded']);
}

class ControllerStateEmpty extends ControllerState {
  ControllerStateEmpty([super.message = 'StateEmpty']);
}

class ControllerStateError extends ControllerState {
  ControllerStateError([super.message = 'StateError']);
}
