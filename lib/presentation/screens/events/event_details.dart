import 'package:flutter/material.dart';
import 'package:of26_local_event_finder_app/presentation/providers/event_provider.dart';
import 'package:of26_local_event_finder_app/presentation/screens/events/widgets/event_map_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/category_color.dart';

class EventDetails extends StatefulWidget {
  static const String routeName = '/event-details';

  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {

  @override
  Widget build(BuildContext context) {

    final eventId = ModalRoute.of(context)!.settings.arguments as String;
    final event = context.watch<EventProvider>().getEventById(eventId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'event-image-${event.id}',
              child: Image.network(
                event.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: getCategoryColor(event.category),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                event.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.calendar_today,
                  //       size: 16,
                  //       color: Colors.grey,
                  //     ),
                  //     const SizedBox(width: 4),
                  //     Text(event.date, style: const TextStyle(color: Colors.grey)),
                  //   ],
                  // ),
                  buildCard(
                      icon: Icons.calendar_today,
                      iconSize: 16,
                      title: 'Date & Time',
                      subTitle: '${event.date}, ${event.time}'
                  ),
                  buildCard(
                      icon: Icons.location_city,
                      iconSize: 20,
                      title: 'Location',
                      subTitle: event.location
                  ),
                  const Text(
                    'About this event',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event.description,
                    style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                  const Text(
                    'Event Location',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  EventMapWidget(
                    latitude: event.latitude,
                    longitude: event.longitude,
                    location: event.location,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard({
    required IconData icon,
    required double iconSize,
    required String title,
    required String subTitle,
  }) {
    return Card(
                  color: Colors.grey.shade50,
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: .start,
                      crossAxisAlignment: .start,
                      spacing: 16,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: Colors.blue,
                          ),
                        ),
                        Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .start,
                          children: [
                            Text(title, style: TextStyle(color: Colors.grey.shade600)),
                            Text(subTitle, style: const TextStyle(color: Colors.black87, fontWeight: .w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
  }
}
