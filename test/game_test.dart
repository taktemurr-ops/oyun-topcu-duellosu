import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_topcu_duellosu/oyun_topcu_duellosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(topcuConfig.title.length, 33);
    expect(topcuConfig.tagline.length, 33);
    for (final s in topcuConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(topcuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: topcuId, optionalMechanics: topcuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(topcuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
