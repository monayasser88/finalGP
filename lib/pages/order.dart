import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/custom_field.dart';
import 'package:jody/components/delivary_pop_up.dart';
import 'package:jody/components/pay_field.dart';
import 'package:jody/cubit/tickets_cubit.dart';
import 'package:jody/pages/tickets.dart';

class Order extends StatelessWidget {
  Order({super.key});
  GlobalKey<FormState> orderFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketsCubit(),
      child: BlocConsumer<TicketsCubit, TicketsState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ShippingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('We prepare your tickets to ship them to you!'),
                duration: Duration(seconds: 3),
              ),
            );
          } else if (state is PayingLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Prepare your credit card to enter you card information!'),
                duration: Duration(seconds: 3),
              ),
            );
          } else if (state is ShippingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMassage),
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Form(
              key: orderFormKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(children: [
                    const SizedBox(
                      height: 55,
                    ),
                    CustomAppBar(
                      title: 'Order',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Tickets();
                        }));
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    CustomField(
                      controller: TicketsCubit.get(context).streetField,
                      label: 'Street',
                      hint: 'Enter your street!',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      controller: TicketsCubit.get(context).cityField,
                      label: 'City',
                      hint: 'Enter your city!',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      controller: TicketsCubit.get(context).phoneField,
                      label: 'Phone',
                      hint: 'Enter your phone!',
                    ),
                    const SizedBox(
                      height: 450,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PayField(
                          text: 'Pay Online',
                          ontap: () {
                            TicketsCubit.get(context)
                                .createOnlineOrder(Dio(), context);
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        state is ShippingLoading
                            ? const CircularProgressIndicator()
                            : PayField(
                                text: 'Pay Cash',
                                ontap: () {
                                  TicketsCubit.get(context).createOrder(Dio());
                                  showCustomPopupdelivary(context);
                                },
                              ),
                      ],
                    )
                  ])),
            ),
          ));
        },
      ),
    );
  }
}
