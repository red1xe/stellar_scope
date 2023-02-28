import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class NasaLibPage extends StatefulWidget {
  static const routeName = "/nasalib";
  const NasaLibPage({super.key});

  @override
  State<NasaLibPage> createState() => _NasaLibPageState();
}

class _NasaLibPageState extends State<NasaLibPage> {
  final List<String> _filters = <String>[];
  List<String> get filters => _filters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nasa Library"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: AnimSearchBar(
              autoFocus: true,
              color: Theme.of(context).colorScheme.secondary,
              onSubmitted: (p0) {},
              width: 350,
              textController: TextEditingController(),
              onSuffixTap: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilterChip(
                avatar: const Icon(Icons.video_collection),
                shape: const StadiumBorder(side: BorderSide()),
                selectedColor: Theme.of(context).colorScheme.secondary,
                label: const Text(
                  "Video",
                ),
                selected: _filters.contains("Video"),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add("Video");
                    } else {
                      _filters.removeWhere((element) => element == "Video");
                    }
                  });
                },
              ),
              const SizedBox(width: 10),
              FilterChip(
                avatar: const Icon(Icons.image),
                selectedColor: Theme.of(context).colorScheme.secondary,
                shape: const StadiumBorder(side: BorderSide()),
                label: const Text("Image"),
                selected: _filters.contains("Image"),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add("Image");
                    } else {
                      _filters.removeWhere((element) => element == "Image");
                    }
                  });
                },
              ),
              const SizedBox(width: 10),
              FilterChip(
                avatar: const Icon(Icons.audiotrack),
                selected: _filters.contains("Audio"),
                selectedColor: Theme.of(context).colorScheme.secondary,
                shape: const StadiumBorder(side: BorderSide()),
                label: const Text("Audio"),
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _filters.add("Audio");
                    } else {
                      _filters.removeWhere((element) => element == "Audio");
                    }
                  });
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
