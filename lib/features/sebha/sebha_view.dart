import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/core/setting_provider.dart';
import 'package:provider/provider.dart';

class SebhaView extends StatefulWidget {
  static const String routeName = 'sebhaView';
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView>
    with SingleTickerProviderStateMixin {
  // ── State ────────────────────────────────────────────────────────────────
  int _count = 0;
  int _dhikrIndex = 0;

  final List<String> _dhikrList = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  // ── Rotation animation ───────────────────────────────────────────────────
  late AnimationController _rotationCtrl;
  late Animation<double> _rotationAnim;
  double _totalRotation = 0;

  @override
  void initState() {
    super.initState();
    _rotationCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _rotationAnim = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _rotationCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _rotationCtrl.dispose();
    super.dispose();
  }

  // ── On press ─────────────────────────────────────────────────────────────
  void _onPress() {
    HapticFeedback.lightImpact();

    final double from = _totalRotation;
    final double to = _totalRotation + (360 / 33);
    _totalRotation = to;

    _rotationAnim = Tween<double>(
      begin: from,
      end: to,
    ).animate(CurvedAnimation(parent: _rotationCtrl, curve: Curves.easeOut));
    _rotationCtrl
      ..reset()
      ..forward();

    setState(() {
      _count++;
      if (_count >= 33) {
        _count = 0;
        _dhikrIndex = (_dhikrIndex + 1) % _dhikrList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1),

          // ── Sebha (head فوق body لازقين) ─────────────────────────────────
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // Body rotating
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: AnimatedBuilder(
                  animation: _rotationAnim,
                  builder: (_, child) => Transform.rotate(
                    angle: _rotationAnim.value * (3.14159 / 180),
                    child: child,
                  ),
                  child: Image.asset(
                    provider.isDark()
                        ? 'assets/images/body_sebha_dark.png'
                        : 'assets/images/body_sebha_logo.png',
                    width: 232,
                  ),
                ),
              ),
              // Head ثابتة فوق
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset(
                  provider.isDark()
                      ? 'assets/images/head_sebha_dark.png'
                      : 'assets/images/head_sebha_logo.png',
                  width: 73,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          // ── Label ────────────────────────────────────────────────────────
          Text('عدد التسبيحات', style: theme.textTheme.bodyLarge),

          const SizedBox(height: 32),

          // ── Counter ──────────────────────────────────────────────────────
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Container(
              key: ValueKey(_count),
              width: 70,
              height: 50,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                '$_count',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ── Dhikr button ─────────────────────────────────────────────────
          GestureDetector(
            onTap: _onPress,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Container(
                key: ValueKey(_dhikrIndex),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  _dhikrList[_dhikrIndex],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
