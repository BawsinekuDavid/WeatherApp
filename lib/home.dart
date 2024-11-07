import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  State<Home> createState() => _HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
              return Switch(
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                thumbColor: const WidgetStatePropertyAll(Colors.orange),
                inactiveTrackColor: Colors.transparent,
                thumbIcon: WidgetStatePropertyAll(
                  themeProvider.isSelected
                      ? const Icon(Icons.nights_stay)
                      : const Icon(Icons.sunny),
                ),
                value: themeProvider.isSelected,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              );
            }),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Accra',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return Icon(
                    themeProvider.isSelected ? Icons.nights_stay : Icons.sunny,
                    size: 300,
                    color:
                        themeProvider.isSelected ? Colors.white : Colors.orange,
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '20°c',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Good Morning',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                'AKWAABA',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                width: 50,
                child: Divider(
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_twighlight),
                      Text("SUNRISE"),
                      Text('7:30')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [Icon(Icons.air), Text("WIND"), Text('5m/s')],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.thermostat),
                      Text("TEMPERATURE"),
                      Text('25')
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
