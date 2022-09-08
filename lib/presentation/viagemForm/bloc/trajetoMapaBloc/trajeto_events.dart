part of 'trajeto_bloc.dart';

abstract class TrajetoEvents {}

class SelectOrigin extends TrajetoEvents {
  String originId;
  SelectOrigin(this.originId);
}

class SelectDestination extends TrajetoEvents {
  String destinationId;
  SelectDestination(this.destinationId);
}

class UpdateWayPoints extends TrajetoEvents {
 List<String>? wayPointId;
 UpdateWayPoints(this.wayPointId);
}

