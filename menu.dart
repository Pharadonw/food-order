import 'package:flutter/material.dart';
import 'food_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double get _totalPrice => foodMenu
      .where((item) => item.isSelected)
      .fold(0.0, (sum, item) => sum + item.price);

  void _toggleSelection(int index) {
    setState(() {
      foodMenu[index].isSelected = !foodMenu[index].isSelected;
    });
  }

  void _clearSelection() {
    setState(() {
      for (var item in foodMenu) {
        item.isSelected = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: foodMenu.length,
              itemBuilder: (context, index) {
                final item = foodMenu[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => _toggleSelection(index),
                  title: Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: ฿${item.price.toStringAsFixed(2)}'),
                      Text(item.description),
                    ],
                  ),
                  trailing: Icon(
                    item.isSelected
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    color: item.isSelected ? Colors.teal : Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Price: ฿${_totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearSelection,
        tooltip: 'Clear Selection',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
