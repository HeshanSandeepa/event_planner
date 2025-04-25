import 'package:flutter/material.dart';
import 'package:event_planner/src/features/events/data/models/organiser_model.dart';

class EventOrganiserView extends StatelessWidget {
  const EventOrganiserView({super.key, required this.organisers});

  final List<OrganiserModel> organisers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Event Name', style: Theme.of(context).textTheme.displayLarge),
        Text('Remote Config Demo InstaFix'),
        ListView.builder(
          itemCount: organisers.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var organiser = organisers[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: OrganiserCard(organiserModel: organiser),
            );
          },
        ),
      ],
    );
  }
}

class OrganiserCard extends StatelessWidget {
  final OrganiserModel organiserModel;

  const OrganiserCard({super.key, required this.organiserModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.account_circle, color: Colors.black),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            '${organiserModel.name} ',
            style: Theme.of(context).textTheme.bodyLarge,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8.0),
        const Icon(Icons.comment, color: Colors.black),
      ],
    );
  }
}
