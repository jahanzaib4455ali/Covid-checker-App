import 'package:flutter/material.dart';
import '../Services/uitilities/states_services.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final StateServices _stateServices = StateServices();
  List<dynamic> _countries = [];
  List<dynamic> _filteredCountries = [];
  bool _isLoading = true;
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  void _fetchCountries() async {
    try {
      final data = await _stateServices.fetchCountriesList();
      setState(() {
        _countries = data;
        _filteredCountries = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error if needed
    }
  }

  void _filterCountries(String query) {
    final filtered = _countries.where((country) {
      final countryName = country['country'].toString().toLowerCase();
      final input = query.toLowerCase();
      return countryName.contains(input);
    }).toList();

    setState(() {
      _searchText = query;
      _filteredCountries = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Countries'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Countries",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterCountries(value);
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredCountries.isEmpty
                ? const Center(child: Text('No countries found'))
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                final country = _filteredCountries[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(country['countryInfo']['flag']),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      country['country'],
                      style:
                      const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Cases: ${country['cases']}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Optional: Add action on tap
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
