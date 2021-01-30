import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_flutter/controller/my_controller.dart';

class DependencyInjection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// Injects an [Instance<S>] in memory.
    ///
    /// No need to define the generic type <[S]> as it's inferred
    /// from the [dependency] parameter.
    ///
    /// - [dependency] The Instance to be injected.
    /// - [tag] optionally, use a [tag] as an "id" to create multiple records
    /// of the same Type<[S]> the [tag] does **not** conflict with the same tags
    /// used by other [dependencies] Types.
    /// - [permanent] keeps the Instance in memory and persist it,
    /// not following [Get.smartManagement]
    /// rules. Although, can be removed by [GetInstance.reset()]
    /// and [Get.delete()]
    /// - [builder] If defined, the [dependency] must be returned from here
    ///
    // MyController myController = Get.put(MyController(),tag:"instance",permanent: true);

    /// Creates a new Instance<S> lazily from the [<S>builder()] callback.
    ///
    /// The first time you call [Get.find()], the [builder()] callback will create
    /// the Instance and persisted as a Singleton (like you would use
    /// [Get.put()]).
    ///
    /// Using [Get.smartManagement] as [SmartManagement.keepFactory] has
    /// the same outcome
    /// as using [fenix:true] :
    /// The internal register of [builder()] will remain in memory to recreate
    /// the Instance if the Instance has been removed with [Get.delete()].
    /// Therefore, future calls to [Get.find()] will return the same Instance.
    ///
    /// If you need to make use of GetxController's life-cycle
    /// ([onInit(), onStart(), onClose()])
    /// [fenix] is a great choice to mix with [GetBuilder()] and [GetX()] widgets,
    /// and/or [GetMaterialApp] Navigation.
    ///
    /// You could use [Get.lazyPut(fenix:true)] in your app's [main()] instead of
    /// [Bindings()] for each [GetPage].
    /// And the memory management will be similar.
    ///
    /// Subsequent calls to [Get.lazyPut()] with the same parameters
    /// (<[S]> and optionally [tag] will **not** override the original).
    ///
    Get.lazyPut(() => MyController(),tag: "instance",fenix: true);

    /// async version of [Get.put()].
    /// Awaits for the resolution of the Future from [builder()] parameter and
    /// stores the Instance returned.
    ///
    // Get.putAsync<MyController>(() async => await MyController());

    /// Creates a new Class Instance [S] from the builder callback[S].
    /// Every time [find]<[S]>() is used, it calls the builder method to generate
    /// a new Instance [S].
    /// It also registers each [instance.onClose()] with the current
    /// Route [GetConfig.currentRoute] to keep the lifecycle active.
    /// Is important to know that the instances created are only stored per Route.
    /// So, if you call `Get.delete<T>()` the "instance factory" used in this
    /// method ([Get.create<T>()]) will be removed, but NOT the instances
    /// already created by it.
    /// Uses `tag` as the other methods.
    ///
    /// Example:
    ///
    /// ```create(() => Repl());
    /// Repl a = find();
    /// Repl b = find();
    /// print(a==b); (false)```
    ///
    // Get.create<MyController>(() => MyController());

    return Column(
      children: [
        RaisedButton(onPressed: (){
          Get.find<MyController>(
            tag: "instance"
          );
        },child: Text("click me"),)
      ],
    );
  }
}
