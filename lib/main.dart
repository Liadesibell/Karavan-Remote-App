import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _background = Color(0xFF08090D);
const _panel = Color(0xFF11131A);
const _panelRaised = Color(0xFF171A22);
const _white = Color(0xFFF6F7FB);
const _muted = Color(0xFF858B9A);
const _line = Color(0xFF252936);
const _iceBlue = Color(0xFF94E8F9);
const _brightCyan = Color(0xFF38D9E8);
const _softPurple = Color(0xFFC979F2);
const _lightGreen = Color(0xFFA6E8AD);
const _lightRed = Color(0xFFFF8585);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: _background,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: _background,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const KaravanApp());
}

class KaravanApp extends StatelessWidget {
  const KaravanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karavanım',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _background,
        colorScheme: const ColorScheme.dark(
          primary: _iceBlue,
          secondary: _brightCyan,
          surface: _panel,
          onSurface: _white,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<double> _brightnessLevels = [0.8, 0.55, 0.3, 0.65];
  final List<bool> _switches = [
    true,
    true,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
    false,
    false,
  ];

  static const _brightnessControls = [
    _BrightnessControl(
      'Tavan ışığı',
      Icons.lightbulb_outline_rounded,
      _iceBlue,
    ),
    _BrightnessControl('Mutfak', Icons.countertops_rounded, _lightGreen),
    _BrightnessControl('Yatak odası', Icons.bed_outlined, _softPurple),
    _BrightnessControl(
      'Dış aydınlatma',
      Icons.wb_twilight_rounded,
      _lightRed,
    ),
  ];

  static const _toggleControls = [
    _ToggleControl('Tavan ışıkları', Icons.lightbulb_outline_rounded),
    _ToggleControl('Mutfak ışığı', Icons.countertops_rounded),
    _ToggleControl('Yatak odası', Icons.bed_outlined),
    _ToggleControl('Banyo ışığı', Icons.shower_outlined),
    _ToggleControl('Dış aydınlatma', Icons.wb_twilight_rounded),
    _ToggleControl('Giriş lambası', Icons.door_front_door_outlined),
    _ToggleControl('Su pompası', Icons.water_drop_outlined),
    _ToggleControl('Buzdolabı', Icons.kitchen_outlined),
    _ToggleControl('Isıtıcı', Icons.whatshot_rounded),
    _ToggleControl('Klima', Icons.ac_unit_rounded),
    _ToggleControl('Havalandırma', Icons.air_rounded),
    _ToggleControl('USB prizleri', Icons.usb_rounded),
    _ToggleControl('12V prizler', Icons.power_rounded),
    _ToggleControl('İnvertör', Icons.electric_bolt_rounded),
    _ToggleControl('Güneş paneli', Icons.solar_power_rounded),
    _ToggleControl('Su ısıtıcısı', Icons.hot_tub_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeader(),
                  const SizedBox(height: 22),
                  _buildBatteryCard(),
                  const SizedBox(height: 12),
                  _buildQuickStatus(),
                  const SizedBox(height: 30),
                  _buildSectionHeading('Işık kontrolü', '04 ZON'),
                  const SizedBox(height: 13),
                  _buildBrightnessGrid(context),
                  const SizedBox(height: 29),
                  _buildSectionHeading('Karavan kontrolleri', '16 CİHAZ'),
                  const SizedBox(height: 13),
                  _buildToggleGrid(context),
                  const SizedBox(height: 23),
                  _buildFooter(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: _iceBlue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: _iceBlue.withValues(alpha: 0.24),
                blurRadius: 22,
                spreadRadius: -5,
              ),
            ],
          ),
          child: const Icon(
            Icons.airport_shuttle_rounded,
            color: _background,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOMAD / 01',
              style: TextStyle(
                color: _muted,
                fontSize: 9,
                letterSpacing: 2.1,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'KARAVANIM',
              style: TextStyle(
                color: _white,
                fontSize: 15,
                letterSpacing: 1,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00A3E8).withValues(alpha: 0.18),
                blurRadius: 20,
                spreadRadius: -5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/makronix_mark.png',
              fit: BoxFit.cover,
              semanticLabel: 'Makronix Teknoloji logosu',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBatteryCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 16, 17, 16),
      decoration: BoxDecoration(
        color: _panel,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: _iceBlue.withValues(alpha: 0.2)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF17252A), Color(0xFF111A20), _panel],
        ),
        boxShadow: [
          BoxShadow(
            color: _iceBlue.withValues(alpha: 0.08),
            blurRadius: 28,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                color: _iceBlue,
                size: 16,
              ),
              const SizedBox(width: 7),
              const Text(
                'GÜÇ SİSTEMİ',
                style: TextStyle(
                  color: _muted,
                  fontSize: 9,
                  letterSpacing: 1.7,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: _iceBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'NORMAL',
                style: TextStyle(
                  color: _white,
                  fontSize: 9,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akü seviyesi',
                      style: TextStyle(
                        color: _white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '%82',
                            style: TextStyle(
                              color: _white,
                              fontSize: 38,
                              height: 1,
                              letterSpacing: -1.8,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: '  /  12.8V',
                            style: TextStyle(
                              color: _muted,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 52,
                height: 52,
                margin: const EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  color: _iceBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: _iceBlue.withValues(alpha: 0.2)),
                ),
                child: const Icon(
                  Icons.battery_charging_full_rounded,
                  color: _iceBlue,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: LinearProgressIndicator(
              value: 0.82,
              minHeight: 5,
              backgroundColor: _line,
              valueColor: AlwaysStoppedAnimation<Color>(_iceBlue),
            ),
          ),
          const SizedBox(height: 9),
          const Row(
            children: [
              Text(
                'Kullanılabilir enerji',
                style: TextStyle(color: _muted, fontSize: 10),
              ),
              Spacer(),
              Text(
                'İyi durumda',
                style: TextStyle(
                  color: _iceBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatus() {
    return const Row(
      children: [
        Expanded(
          child: _QuickStatusCard(
            icon: Icons.water_drop_rounded,
            label: 'TEMİZ SU',
            value: '%64',
            detail: 'Seviye yeterli',
            color: _brightCyan,
            progress: 0.64,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _QuickStatusCard(
            icon: Icons.device_thermostat_rounded,
            label: 'İÇ SICAKLIK',
            value: '22°',
            detail: 'Konforlu',
            color: _softPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeading(String title, String trailing) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: _white,
            fontSize: 17,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          trailing,
          style: const TextStyle(
            color: _muted,
            fontSize: 9,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildBrightnessGrid(BuildContext context) {
    final cardWidth = (MediaQuery.sizeOf(context).width - 46) / 2;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(_brightnessControls.length, (index) {
        final control = _brightnessControls[index];
        final level = _brightnessLevels[index];

        return SizedBox(
          width: cardWidth,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            decoration: BoxDecoration(
              color: _panel,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: _line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(control.icon, color: control.color, size: 17),
                    const SizedBox(width: 7),
                    Expanded(
                      child: Text(
                        control.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: _white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: control.color,
                          inactiveTrackColor: _line,
                          thumbColor: control.color,
                          overlayColor: control.color.withValues(alpha: 0.12),
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 6,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 13,
                          ),
                        ),
                        child: Slider(
                          value: level,
                          onChanged: (value) {
                            setState(() => _brightnessLevels[index] = value);
                          },
                          semanticFormatterCallback: (value) =>
                              '${control.label}, ${(value * 100).round()}%',
                        ),
                      ),
                    ),
                    Text(
                      '${(level * 100).round()}%',
                      style: TextStyle(
                        color: control.color,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildToggleGrid(BuildContext context) {
    final cardWidth = (MediaQuery.sizeOf(context).width - 46) / 2;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(_toggleControls.length, (index) {
        final control = _toggleControls[index];
        final isOn = _switches[index];

        return SizedBox(
          width: cardWidth,
          child: Semantics(
            label: control.label,
            toggled: isOn,
            child: Material(
              color: isOn ? const Color(0xFF142328) : _panel,
              borderRadius: BorderRadius.circular(17),
              child: InkWell(
                borderRadius: BorderRadius.circular(17),
                onTap: () => setState(() => _switches[index] = !isOn),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 72),
                  padding: const EdgeInsets.fromLTRB(10, 9, 6, 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      color: isOn ? _iceBlue.withValues(alpha: 0.48) : _line,
                    ),
                    boxShadow: isOn
                        ? [
                            BoxShadow(
                              color: _iceBlue.withValues(alpha: 0.14),
                              blurRadius: 18,
                              spreadRadius: -6,
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: isOn ? _iceBlue : _panelRaised,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isOn
                              ? [
                                  BoxShadow(
                                    color: _iceBlue.withValues(alpha: 0.4),
                                    blurRadius: 18,
                                  ),
                                ]
                              : null,
                        ),
                        child: Icon(
                          control.icon,
                          size: 17,
                          color: isOn ? _background : _muted,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          control.label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: isOn ? _white : _muted,
                            fontSize: 9,
                            height: 1.25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.74,
                        child: Switch(
                          value: isOn,
                          onChanged: (value) {
                            setState(() => _switches[index] = value);
                          },
                          activeThumbColor: _background,
                          activeTrackColor: _iceBlue,
                          inactiveThumbColor: _muted,
                          inactiveTrackColor: _panelRaised,
                          trackOutlineColor: WidgetStateProperty.resolveWith(
                            (states) => states.contains(WidgetState.selected)
                                ? Colors.transparent
                                : _white.withValues(alpha: 0.9),
                          ),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wifi_off_rounded, color: _muted, size: 13),
        const SizedBox(width: 6),
        Text(
          'DEMO MODU  ·  SENSÖR BAĞLANTISI YOK',
          style: TextStyle(
            color: _muted.withValues(alpha: 0.8),
            fontSize: 8,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _QuickStatusCard extends StatelessWidget {
  const _QuickStatusCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.detail,
    required this.color,
    this.progress,
  });

  final IconData icon;
  final String label;
  final String value;
  final String detail;
  final Color color;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 104),
      padding: const EdgeInsets.fromLTRB(12, 11, 12, 10),
      decoration: BoxDecoration(
        color: _panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: _muted,
                  fontSize: 8,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 24,
                  height: 1,
                  letterSpacing: -0.6,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (progress != null) ...[
                const SizedBox(width: 9),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 3,
                        backgroundColor: _line,
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 6),
          Text(
            detail,
            style: const TextStyle(color: _muted, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

class _BrightnessControl {
  const _BrightnessControl(this.label, this.icon, this.color);

  final String label;
  final IconData icon;
  final Color color;
}

class _ToggleControl {
  const _ToggleControl(this.label, this.icon);

  final String label;
  final IconData icon;
}
