class PrintLog {
  static void printLog({ fileName,
       functionName,
       blockNumber,
       printStatement}) {
    print('\n--->$fileName :: $functionName -- Block $blockNumber\n');
    print(printStatement);
    print('\n-------------- End Block $blockNumber \n');
  }
}
