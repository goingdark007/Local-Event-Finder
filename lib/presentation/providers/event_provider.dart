import 'package:flutter/cupertino.dart';
import 'package:of26_local_event_finder_app/data/services/event_service.dart';

import '../../domain/entities/event.dart';

class EventProvider extends ChangeNotifier{

  EventProvider(this.eventService);

  final EventService eventService;

  List<Event> _events = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  Future<void> loadEvent() async {

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try{
      _events = await eventService.getAllEvents();
      _isLoading = false;
    } catch (e) {
      _errorMessage = 'Failed to load events ${e.toString()}';
      _isLoading = false;
    }

    notifyListeners();

  }

  Event getEventById(String id){

    return _events.firstWhere((event) => event.id == id);

  }

  Future<void> refreshEvents() async {
    await loadEvent();
  }

}