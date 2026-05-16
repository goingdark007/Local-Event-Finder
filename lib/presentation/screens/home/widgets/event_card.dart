import 'package:flutter/material.dart';
import 'package:of26_local_event_finder_app/core/category_color.dart';

import '../../../../domain/entities/event.dart';

class EventCard extends StatelessWidget {

  final Event event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: .start,
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
                  child: Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
                ),
              ),
          ),

          Container(

            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: getCategoryColor(event.category),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12)
              ),
            ),
            child: Text(
              event.category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: .bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: .start,
              children: [

                Text(event.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                 Row(
                   children: [
                     Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade700),
                     SizedBox(width: 4),
                     Text(event.date, style: TextStyle(color: Colors.grey.shade600))
                   ],
                 ),

                 Wrap(
                   children: [
                     Icon(Icons.location_city, size: 20, color: Colors.grey.shade700,),
                     SizedBox(width: 4),
                     Text(
                       event.location,
                       style: TextStyle(color: Colors.grey.shade600),
                     )
                   ],
                 )

              ],
            ),
          )

        ],
      ),
    );

  }

}