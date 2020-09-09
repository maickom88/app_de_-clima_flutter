abstract class Failure implements Exception {}

class InvalidText implements Failure {}

class DataSourceError implements Failure {}

class AccessDenied implements Failure {}
