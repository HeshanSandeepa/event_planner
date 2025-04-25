import 'package:event_planner/src/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/src/features/events/data/models/organiser_model.dart';

class EventOrganiserView extends StatelessWidget {
  const EventOrganiserView({super.key, required this.organisers});

  final List<OrganiserModel> organisers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Strings.eventNameHolder,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
              Text(
                Strings.eventName,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        ListView.separated(
          itemCount: organisers.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var organiser = organisers[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: OrganiserCard(organiserModel: organiser),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
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
        const Icon(
          Icons.account_circle,
          color: Colors.black,
          size: 44,
        ),
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
