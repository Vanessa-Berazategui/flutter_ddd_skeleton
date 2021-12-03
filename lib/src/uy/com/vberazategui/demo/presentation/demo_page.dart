import 'package:flutter/material.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/presentation/blocs/demo_page_bloc.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/injection/injection.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/lang/l10n.dart';
import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/shared/presentation/routes/router.gr.dart';
import 'package:provider/provider.dart';

class DemoPage extends StatefulWidget {
  const DemoPage() : super(key: const ValueKey(DemoRoute.name));

  @override
  // ignore: library_private_types_in_public_api
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _bloc = getIt<DemoPageBLoC>();

  @override
  Widget build(BuildContext context) {
    final body = SafeArea(
      child: ChangeNotifierProvider<DemoPageBLoC>(
        create: (context) => _bloc,
        child: Consumer<DemoPageBLoC>(
          builder: (context, bloc, child) => Center(
            child: Text(
              AppLocalizations.of(context).tx_demo,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (BuildContext context) {
          return body;
        },
      ),
    );
  }
}
