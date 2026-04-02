import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_app/layout/layout_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  // ── Logo scale + fade ────────────────────────────────────────────────────
  late AnimationController _logoCtrl;
  late Animation<double> _logoScale;
  late Animation<double> _logoFade;

  // ── Content slide + fade ─────────────────────────────────────────────────
  late AnimationController _contentCtrl;
  late Animation<double> _nameFade;
  late Animation<Offset> _nameSlide;
  late Animation<double> _lineFade;
  late Animation<double> _barFade;
  late Animation<double> _bisFade;

  // ── Rings rotation ───────────────────────────────────────────────────────
  late AnimationController _ring1Ctrl;
  late AnimationController _ring2Ctrl;
  late AnimationController _ring3Ctrl;

  // ── Loading bar ──────────────────────────────────────────────────────────
  late AnimationController _loadCtrl;
  late Animation<double> _loadValue;

  // ── Logo pulse glow ──────────────────────────────────────────────────────
  late AnimationController _pulseCtrl;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    // Logo entrance
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _logoScale = Tween(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.elasticOut));
    _logoFade = CurvedAnimation(parent: _logoCtrl, curve: Curves.easeIn);

    // Content entrance
    _contentCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _nameFade = CurvedAnimation(
      parent: _contentCtrl,
      curve: const Interval(0.0, 0.7, curve: Curves.easeIn),
    );
    _nameSlide = Tween(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _contentCtrl,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    _lineFade = CurvedAnimation(
      parent: _contentCtrl,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    );
    _barFade = CurvedAnimation(
      parent: _contentCtrl,
      curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
    );
    _bisFade = CurvedAnimation(
      parent: _contentCtrl,
      curve: const Interval(0.1, 0.8, curve: Curves.easeIn),
    );

    // Rings
    _ring1Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();
    _ring2Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 34),
    )..repeat(reverse: true);
    _ring3Ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50),
    )..repeat();

    // Loading bar — 3 seconds total duration
    _loadCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _loadValue = CurvedAnimation(parent: _loadCtrl, curve: Curves.easeInOut);

    // Pulse glow
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _pulseAnim = Tween(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));

    // Sequence
    _logoCtrl.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _contentCtrl.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _loadCtrl.forward();
    });

    // Navigate after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted)
        Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    _contentCtrl.dispose();
    _ring1Ctrl.dispose();
    _ring2Ctrl.dispose();
    _ring3Ctrl.dispose();
    _loadCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D1A),
      body: Stack(
        children: [
          // ── Corner glows ────────────────────────────────────────────────
          _cornerGlow(top: -80, left: -80, size: 260),
          _cornerGlow(bottom: -70, right: -70, size: 230),

          // ── Rotating rings ───────────────────────────────────────────────
          ..._buildRings(),

          // ── Main content ─────────────────────────────────────────────────
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                _buildLogo(),

                const SizedBox(height: 28),

                // Arabic name
                SlideTransition(
                  position: _nameSlide,
                  child: FadeTransition(
                    opacity: _nameFade,
                    child: Text(
                      'إسلامي',
                      style: GoogleFonts.amiri(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB7935F),
                        letterSpacing: 2,
                        height: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // English name
                FadeTransition(
                  opacity: _nameFade,
                  child: Text(
                    'ISLAMIC APP',
                    style: GoogleFonts.cairo(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFB7935F).withOpacity(0.5),
                      letterSpacing: 8,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Gold divider
                FadeTransition(
                  opacity: _lineFade,
                  child: Container(
                    width: 80,
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Color(0xFFB7935F),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Loading bar
                FadeTransition(
                  opacity: _barFade,
                  child: SizedBox(
                    width: 52,
                    height: 2,
                    child: AnimatedBuilder(
                      animation: _loadValue,
                      builder: (_, __) => LinearProgressIndicator(
                        value: _loadValue.value,
                        backgroundColor: Color(0xFFB7935F).withOpacity(0.15),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFFB7935F),
                        ),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Bismillah bottom ─────────────────────────────────────────────
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _bisFade,
              child: Text(
                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                textAlign: TextAlign.center,
                style: GoogleFonts.amiri(
                  fontSize: 14,
                  color: Color(0xFFB7935F).withOpacity(0.38),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Logo widget ──────────────────────────────────────────────────────────
  Widget _buildLogo() {
    return ScaleTransition(
      scale: _logoScale,
      child: FadeTransition(
        opacity: _logoFade,
        child: AnimatedBuilder(
          animation: _pulseAnim,
          builder: (_, child) => Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFB7935F).withOpacity(0.3 * _pulseAnim.value),
                  blurRadius: 40 + 20 * _pulseAnim.value,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: child,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/icons/splash_logo.png',
              width: 160,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // ── Rotating rings ───────────────────────────────────────────────────────
  List<Widget> _buildRings() {
    return [
      _ring(_ring1Ctrl, 190, reverse: false, opacity: 0.18),
      _ring(_ring2Ctrl, 260, reverse: true, opacity: 0.10),
      _ring(_ring3Ctrl, 340, reverse: false, opacity: 0.07),
      _staticRing(420, opacity: 0.05),
      _staticRing(510, opacity: 0.04),
    ];
  }

  Widget _ring(
    AnimationController ctrl,
    double size, {
    required bool reverse,
    required double opacity,
  }) {
    return Positioned.fill(
      child: Center(
        child: AnimatedBuilder(
          animation: ctrl,
          builder: (_, __) {
            final angle = (reverse ? -1 : 1) * ctrl.value * 2 * pi;
            return Transform.rotate(
              angle: angle,
              child: _ringContainer(size, opacity),
            );
          },
        ),
      ),
    );
  }

  Widget _staticRing(double size, {required double opacity}) {
    return Positioned.fill(child: Center(child: _ringContainer(size, opacity)));
  }

  Widget _ringContainer(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFB7935F).withOpacity(opacity),
          width: 1,
        ),
      ),
    );
  }

  // ── Corner glow ──────────────────────────────────────────────────────────
  Widget _cornerGlow({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Color(0xFFB7935F).withOpacity(0.15), Colors.transparent],
          ),
        ),
      ),
    );
  }
}
