import 'dart:async';

class SortAlgorithms {
  static Future<void> sort(
    List<int> numbers,
    String algorithm,
    int speed,
    Function setState,
    {required Function(int, int) highlight}
  ) async {
    switch (algorithm) {
      case 'Bubble Sort':
        await _bubbleSort(numbers, speed, setState, highlight);
        break;
      case 'Insertion Sort':
        await _insertionSort(numbers, speed, setState, highlight);
        break;
      case 'Merge Sort':
        await _mergeSort(numbers, 0, numbers.length - 1, speed, setState, highlight);
        break;
      case 'Quick Sort':
        await _quickSort(numbers, 0, numbers.length - 1, speed, setState, highlight);
        break;
      case 'Selection Sort':
        await _selectionSort(numbers, speed, setState, highlight);
        break;
    }
  }
    static Future<void> _selectionSort(
      List<int> numbers, int speed, Function setState, Function(int, int) highlight) async {
        
       for(int i=0; i<numbers.length-1 ;i++){
        int index = i;
          for(int j= i+1; j< numbers.length; j++){
            if(numbers[index]>numbers[j]){
                index = j;
            }
       }
         setState(() {
          highlight(i,index);
         });
        await Future.delayed(Duration(milliseconds: speed));
            int temp = numbers[index];
            numbers[index]= numbers[i];
            numbers[i] = temp;
            setState(() {});
            await Future.delayed(Duration(milliseconds: speed));
        }
      }
  static Future<void> _bubbleSort(
      List<int> numbers, int speed, Function setState, Function(int, int) highlight) async {
    for (int i = 0; i < numbers.length - 1; i++) {
      for (int j = 0; j < numbers.length - i - 1; j++) {
        highlight(j, j + 1);
        await Future.delayed(Duration(milliseconds: speed));
        if (numbers[j] > numbers[j + 1]) {
          int temp = numbers[j];
          numbers[j] = numbers[j + 1];
          numbers[j + 1] = temp;
          setState(() {});
          await Future.delayed(Duration(milliseconds: speed));
        }
      }
    }
  }

  static Future<void> _insertionSort(
      List<int> numbers, int speed, Function setState, Function(int, int) highlight) async {
    for (int i = 1; i < numbers.length; i++) {
      int key = numbers[i];
      int j = i - 1;
      while (j >= 0 && numbers[j] > key) {
        highlight(j, j + 1);
        await Future.delayed(Duration(milliseconds: speed));
        numbers[j + 1] = numbers[j];
        j = j - 1;
        setState(() {});
        await Future.delayed(Duration(milliseconds: speed));
      }
      numbers[j + 1] = key;
    }
  }

  static Future<void> _mergeSort(
      List<int> numbers, int left, int right, int speed, Function setState, Function(int, int) highlight) async {
    if (left < right) {
      int mid = left + (right - left) ~/ 2;
      await _mergeSort(numbers, left, mid, speed, setState, highlight);
      await _mergeSort(numbers, mid + 1, right, speed, setState, highlight);
      await _merge(numbers, left, mid, right, speed, setState, highlight);
    }
  }

  static Future<void> _merge(List<int> numbers, int left, int mid, int right,
      int speed, Function setState, Function(int, int) highlight) async {
    int leftSize = mid - left + 1;
    int rightSize = right - mid;
    List<int> leftArr = List<int>.filled(leftSize, 0);
    List<int> rightArr = List<int>.filled(rightSize, 0);
    for (int i = 0; i < leftSize; i++) leftArr[i] = numbers[left + i];
    for (int j = 0; j < rightSize; j++) rightArr[j] = numbers[mid + 1 + j];
    int i = 0, j = 0, k = left;
    while (i < leftSize && j < rightSize) {
      highlight(left + i, mid + 1 + j);
      await Future.delayed(Duration(milliseconds: speed));
      if (leftArr[i] <= rightArr[j]) {
        numbers[k] = leftArr[i];
        i++;
      } else {
        numbers[k] = rightArr[j];
        j++;
      }
      k++;
      setState(() {});
    }
    while (i < leftSize) numbers[k++] = leftArr[i++];
    while (j < rightSize) numbers[k++] = rightArr[j++];
  }

  static Future<void> _quickSort(
      List<int> numbers, int low, int high, int speed, Function setState, Function(int, int) highlight) async {
    if (low < high) {
      int pi = await _partition(numbers, low, high, speed, setState, highlight);
      await _quickSort(numbers, low, pi - 1, speed, setState, highlight);
      await _quickSort(numbers, pi + 1, high, speed, setState, highlight);
    }
  }

  static Future<int> _partition(List<int> numbers, int low, int high, int speed,
      Function setState, Function(int, int) highlight) async {
    int pivot = numbers[high];
    int i = low - 1;
    for (int j = low; j <= high - 1; j++) {
      highlight(j, high);
      await Future.delayed(Duration(milliseconds: speed));
      if (numbers[j] < pivot) {
        i++;
        int temp = numbers[i];
        numbers[i] = numbers[j];
        numbers[j] = temp;
        setState(() {});
        await Future.delayed(Duration(milliseconds: speed));
      }
    }
    int temp = numbers[i + 1];
    numbers[i + 1] = numbers[high];
    numbers[high] = temp;
    setState(() {});
    return i + 1;
  }
}
