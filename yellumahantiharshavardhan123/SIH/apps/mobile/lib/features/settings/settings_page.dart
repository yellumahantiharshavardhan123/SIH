import 'dart:math';
import 'package:flutter/material.dart';
import '../../config/supabase.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool share = false;
  String? code;
  @override
  void initState() {
    super.initState();
    () async {
      final u = sb.auth.currentUser; if (u==null) return;
      final p = await sb.from('profiles').select('*').eq('id', u.id).single();
      setState(()=>share = (p.data['share_location_opt_in'] ?? false) as bool);
      final fl = await sb.from('family_links').select('*').eq('user_id', u.id).maybeSingle();
      if (fl.data != null) setState(()=>code = fl.data['code']);
    }();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SwitchListTile(value: share, title: const Text('Share location with family'), onChanged: (v) async {
            setState(()=>share=v);
            await sb.from('profiles').update({'share_location_opt_in': v}).eq('id', sb.auth.currentUser?.id ?? '');
          }),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () async {
            final u = sb.auth.currentUser!;
            code ??= _randomCode();
            await sb.from('family_links').upsert({'user_id': u.id, 'code': code, 'active': true}).select();
            setState((){});
          }, child: const Text('Generate family link')),
          if (code != null) Padding(padding: const EdgeInsets.only(top:8), child: SelectableText('Code: $code')),
        ]),
      ),
    );
  }

  String _randomCode() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final r = Random();
    return List.generate(8, (_) => chars[r.nextInt(chars.length)]).join();
  }
}
