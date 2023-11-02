Map<String, Map<String, WasteInfo>> wasteInfoMap = {
  '합성수지': {
    '페트병': WasteInfo(
      methods: [
        '1. 페트병에 남아있는 내용물을 비워주세요.',
        '2. 물로 페트병을 깨끗이 씻어주세요.',
        '3. 뚜껑, 라벨, 페트병을 각각 분리해주세요.',
        '4. 페트병을 압착하여 공간을 절약해주세요.',
        '5. 뚜껑, 라벨, 페트병을 각각 분리수거함에 버려주세요.'
      ],
      imageUrl: 'assets/images/trash/pla_bottle.jpg',
    ),
    '비닐류': WasteInfo(
      methods: [
        '1. 비닐에 붙어있는 이물질을 제거해주세요.',
        '2. 비닐을 깨끗이 씻어주세요.',
        '3. 씻은 비닐을 잘 말려주세요.',
        '4. 말린 비닐을 묶어서 비닐류 전용 분리수거함에 버려주세요.'
      ],
      imageUrl: 'assets/images/trash/vinyl.jpg',
    ),
    '플라스틱': WasteInfo(
      methods: [
        '1. 플라스틱 제품에 붙어있는 이물질을 제거해주세요.',
        '2. 플라스틱을 물로 깨끗이 씻어주세요.',
        '3. 씻은 플라스틱을 잘 말려주세요.',
        '4. 말린 플라스틱을 압착하여 공간을 절약해주세요.',
        '5. 압착한 플라스틱을 플라스틱류 전용 분리수거함에 버려주세요.',
      ],
      imageUrl: 'assets/images/trash/pla.jpg',
    ),
  },
  '금속': {
    '캔류': WasteInfo(
      methods: [
        '1. 캔류에 남아있는 내용물을 비워주세요.',
        '2. 물로 캔을 깨끗이 씻어주세요.',
        '3. 씻은 캔을 잘 말려주세요.',
        '4. 말린 캔은 압착하여 공간을 절약해주세요.',
        '5. 압착한 캔을 캔류 전용 분리수거함에 버려주세요.',
      ],
      imageUrl: 'assets/images/trash/can.jpg',
    ),
  },
  '종이': {
    '종이': WasteInfo(
      methods: [
        '1. 종이에 붙어있는 테이프나 스테이플러 등을 제거합니다.',
        '2. 종이를 깨끗이 펼쳐놓아주세요.',
        '3. 펼쳐진 종이를 묶어서 종이류 전용 분리수거함에 버려주세요.',
      ],
      imageUrl: 'assets/images/trash/paper.jpg',
    ),
    '일반팩': WasteInfo(
      methods: [
        '1. 종이팩에 남아있는 내용물을 비워주세요.',
        '2. 종이팩을 물로 깨끗이 씻어주세요.',
        '3. 씻은 종이팩은 잘 말려주세요.',
        '4. 말린 종이팩을 묶어서 종이팩 전용 분리수거함에 버려주세요.',
      ],
      imageUrl: 'assets/images/trash/paperpack.jfif',
    ),
    '멸균팩': WasteInfo(
      methods: [
        '1. 멸균팩에 남아있는 내용물을 비워주세요.',
        '2. 멸균팩을 물로 깨끗이 씻어주세요.',
        '3. 씻은 멸균팩은 잘 말려주세요.',
        '4. 말린 멸균팩을 묶어서 멸균팩 전용 분리수거함에 버려주세요.',
      ],
      imageUrl: 'assets/images/trash/nonopack.png',
    ),
  }
};

class WasteInfo {
  final List<String> methods;
  final String imageUrl;

  WasteInfo({required this.methods, required this.imageUrl});
}
