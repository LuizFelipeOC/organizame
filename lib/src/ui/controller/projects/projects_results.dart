abstract interface class ProjectState {}

class IdleProjectState extends ProjectState {}

class LoadingProjectState extends ProjectState {}

class SuccessProjectState extends ProjectState {}

class ErrorProjectState extends ProjectState {}
