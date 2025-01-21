import 'package:flutter/material.dart';
import 'models/service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy data for demonstration
  final List<Service> services = [
    Service(
      id: '1',
      serviceName: 'Oil Change',
      vehicleName: 'Toyota Corolla',
      dueDate: DateTime.now().add(Duration(days: 7)),
    ),
    Service(
      id: '2',
      serviceName: 'Tire Rotation',
      vehicleName: 'Honda Civic',
      dueDate: DateTime.now().add(Duration(days: 14)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Services'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Vehicle Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(service.serviceName),
                    subtitle: Text(service.vehicleName),
                    trailing: Text(
                      '${service.dueDate.day}/${service.dueDate.month}/${service.dueDate.year}',
                      style: TextStyle(
                        color: service.dueDate.difference(DateTime.now()).inDays < 7
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                    onTap: () {
                      // Add service detail view logic here
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialog to add new service
          _showAddServiceDialog();
        },
        child: Icon(Icons.add),
        tooltip: 'Add Service',
      ),
    );
  }

  void _showAddServiceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String serviceName = '';
        String vehicleName = '';
        DateTime selectedDate = DateTime.now();

        return AlertDialog(
          title: Text('Add New Service'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Service Name'),
                onChanged: (value) => serviceName = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Vehicle Name'),
                onChanged: (value) => vehicleName = value,
              ),
              TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (date != null) {
                    selectedDate = date;
                  }
                },
                child: Text('Select Due Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (serviceName.isNotEmpty && vehicleName.isNotEmpty) {
                  setState(() {
                    services.add(Service(
                      id: DateTime.now().toString(),
                      serviceName: serviceName,
                      vehicleName: vehicleName,
                      dueDate: selectedDate,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
