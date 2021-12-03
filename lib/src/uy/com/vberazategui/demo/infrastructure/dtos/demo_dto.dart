import 'package:flutter_ddd_skeleton/src/uy/com/vberazategui/demo/domain/entities/demo.dart';

class DemoDto extends Demo {
  DemoDto({
    required String demoDetail,
  }) : super(
          demoDetail: demoDetail,
        );

  factory DemoDto.fromJson(Map<String, dynamic> parsedJson) {
    return DemoDto(
      demoDetail: parsedJson['id'],
    );
  }

  factory DemoDto.fromDomain(Demo entity) {
    return DemoDto(
      demoDetail: entity.demoDetail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'demoDetail': demoDetail,
    };
  }
}
