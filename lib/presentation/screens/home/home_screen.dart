import 'package:flutter/material.dart';
import 'package:of26_local_event_finder_app/presentation/providers/event_provider.dart';
import 'package:of26_local_event_finder_app/presentation/screens/events/event_details.dart';
import 'package:of26_local_event_finder_app/presentation/screens/home/widgets/event_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{

  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      context.read<EventProvider>().loadEvent();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Local Event Finder', style: TextStyle(fontWeight: .bold)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Consumer<EventProvider>(
        builder: (context, provider, child) {

          if(provider.isLoading) return const Center(child: CircularProgressIndicator());

          if(provider.hasError) return const Center(child: Text('Failed to Load'));

          return ListView.builder(
              itemCount: provider.events.length,
              itemBuilder: (BuildContext context, int index) {

                final event = provider.events[index];

                return EventCard(
                  event: event,
                  onTap: () {
                      Navigator.pushNamed(context, EventDetails.routeName, arguments: event.id);
                  },
                );
              }
          );
        }
      ),

    );

  }
}