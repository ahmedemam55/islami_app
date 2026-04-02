import 'package:flutter/material.dart';

class RadioView extends StatefulWidget {
  static const String routeName = 'radioView';
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),

          // ── Radio Image ─────────────────────────────────────────────────
          Image.asset('assets/images/radio_image.png', width: 412),

          const SizedBox(height: 40),

          // ── Station Name ────────────────────────────────────────────────
          Text(
            'إذاعة القرآن الكريم',
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 40),

          // ── Controls ────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Previous
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 40,
                color: theme.primaryColor,
              ),

              const SizedBox(width: 16),

              // Play / Pause
              IconButton(
                onPressed: () {
                  setState(() => _isPlaying = !_isPlaying);
                },
                icon: Icon(
                  _isPlaying
                      ? Icons.pause_circle_filled_rounded
                      : Icons.play_arrow_rounded,
                ),
                iconSize: 56,
                color: theme.primaryColor,
              ),

              const SizedBox(width: 16),

              // Next
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 40,
                color: theme.primaryColor,
              ),
            ],
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
