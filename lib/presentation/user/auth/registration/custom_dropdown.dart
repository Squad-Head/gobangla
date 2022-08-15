import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomDropdown extends HookWidget {
  final TextEditingController controller;
  final String title;
  final IconData icon;
  final List<String> items;
  const CustomDropdown(
      {Key? key,
      required this.controller,
      required this.title,
      required this.icon,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> value = useState(null);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 1), blurRadius: 2.0)
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                icon,
                color: Colors.green,
                size: 30,
              ),
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                    value: value.value,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (v) {
                      if (v != null) {
                        controller.text = v;
                        value.value = v;
                      }
                    },
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
