import 'package:flutter/material.dart';
import 'package:weather_forecast_flutter/data/city_instances.dart';
import 'package:weather_forecast_flutter/models/city.dart';

import '../models/weather_model.dart';

class AutoComplete extends StatefulWidget {
  final Function(dynamic selection) notifyParent;
  final Function() notifyParent2;
  const AutoComplete(
      {Key? key, required this.notifyParent, required this.notifyParent2})
      : super(key: key);

  get weatherData => this.weatherData;
  @override
  State<StatefulWidget> createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Autocomplete<City>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return cityOptions
              .where((City city) => city.name
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase()))
              .toList();
        },
        displayStringForOption: (City option) => option.name,
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              onTap: () {
                setState(() {
                  widget.notifyParent2();
                });
              },
              decoration: InputDecoration(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.blue.shade400,
                ),
                // suffixIcon: IconButton(
                //     icon: Icon(Icons.send),
                //     color: Colors.blue.shade400,
                //     onPressed: () => {
                //           // print("from autocomplete ${fieldTextEditingController.selection}"),
                //           // setState(() {
                //           //   widget.notifyParent(
                //           //       fieldTextEditingController.value);
                //           // })
                //         }),
                hintText: "Type and choose your location",
                border: InputBorder.none,
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
        onSelected: (City selection) {
          print('Selected: ${selection.eng}');
          setState(() {
            widget.notifyParent(selection.eng);
          });
        },
        optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<City> onSelected, Iterable<City> options) {
          return Material(
            // color: Colors.blue.shade200,
            // borderRadius: BorderRadius.circular(29),
            child: Container(
              // height: 250,
              // width: 100,
              color: Colors.grey.shade200,
              margin: const EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 10.0),
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final City option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option.name,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
