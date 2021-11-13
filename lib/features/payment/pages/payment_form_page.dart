import 'package:dropdown_search/dropdown_search.dart';
import 'package:fdl_api/fdl_api.dart';
import 'package:fdl_app/features/payment/controllers/payment_page_controller.dart';
import 'package:fdl_app/shared/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentFormPage extends ConsumerWidget {
  PaymentFormPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, watch) {
    final controller = watch(paymentPageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownSearch<User>(
                  isFilteredOnline: true,
                  mode: Mode.BOTTOM_SHEET,
                  showSearchBox: true,
                  onFind: controller.findUsers,
                  showAsSuffixIcons: true,
                  itemAsString: (user) => user!.nickname,
                  onChanged: (user) => controller.user = user,
                  validator: (value) {
                    if (value == null) {
                      return 'This field is required';
                    }
                  },
                  dropdownSearchDecoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    label: Text('Payee'),
                  ).applyDefaults(Theme.of(context).inputDecorationTheme),
                  popupItemBuilder: (context, user, _) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          'https://minotar.net/helm/${user.nickname}.png',
                          fit: BoxFit.cover,
                          width: 36,
                          height: 36,
                        ),
                      ),
                      title: Text(user.nickname),
                    );
                  },
                ),
                const BSpacer(16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    label: Text('Amount'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => controller.amount = int.tryParse(value),
                ),
                const BSpacer(16),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.comment),
                    label: Text('Comment (optional)'),
                  ),
                ),
                const BSpacer(16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              controller.isLoading = true;
                              controller.pay().then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('pog')),
                                );
                                _formKey.currentState!.reset();
                              }).catchError((error, _) {
                                if (error is InsuffuicientFundsError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Insuffuicient funds.')),
                                  );
                                }
                                if (error is UserNotFoundError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('User not found. (how lol)'),
                                    ),
                                  );
                                }
                                if (error is CannotPayToYourselfError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Cannot pay to yourself.'),
                                    ),
                                  );
                                }
                              }).whenComplete(
                                () => controller.isLoading = false,
                              );
                            }
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: controller.isLoading
                          ? const Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const Text('Pay'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
