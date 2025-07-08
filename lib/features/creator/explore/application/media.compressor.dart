import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZMediaCompressor {
  ZMediaCompressor._();

  static Future<File> compressImage({required File file}) async {
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.absolute.path}_compressed.jpg',
      quality: 70, // You can adjust compression ratio
    );
    return File(compressedFile?.path ?? file.path);
  }

  // returns the compressed file
  static Future<File> compressVideo({required File file, int? duration}) async {
    try {
      //await VideoCompress.setLogLevel(0);
      var result =
          duration == null
              ? await VideoCompress.compressVideo(
                file.path,
                quality: VideoQuality.DefaultQuality,
                deleteOrigin: true,
              )
              : await VideoCompress.compressVideo(
                file.path,
                quality: VideoQuality.DefaultQuality,
                deleteOrigin: true,
                startTime: 0, // customize start time
                duration: duration, // customize the length
              );

      return result!.file!;
    } catch (err) {
      VideoCompress.cancelCompression();
      zeaznLogger.e('Error compressing: ${err.toString()}');
      return file; // return original file if compression fails
    }
  }

  // static Future<File> trimVideo({required File videoFile}) async {
  //   final basePath =
  //       await
  //       //getTemporaryDirectory();
  //       getApplicationDocumentsDirectory();
  //   final ext = videoFile.path.split('/').last.split('.').last;
  //   final String videoName = path.basename(videoFile.path).split('.')[0];
  //   final outputPath = '${basePath.path}/$videoName.$ext';

  //   // Trim video without sacrificing it's quality
  //   String command =
  //       '-i ${videoFile.path} -ss 00:00:00 -to 00:00:30 -c:v copy -c:a copy $outputPath';

  //   FFmpegKit.executeAsync(
  //     command,
  //     (session) async {
  //       final returnCode = await session.getReturnCode();
  //       final log = await session.getFailStackTrace();
  //       // final logCallback =  session.getLogCallback();

  //       if (ReturnCode.isSuccess(returnCode)) {
  //         zeaznLogger.w('Compression completed');
  //       } else {
  //         if (log == null) {
  //           zeaznLogger.e('Error: File already exist');
  //         } else {
  //           zeaznLogger.e('StackTrace: $log');
  //         }
  //       }
  //     },
  //     (log) {
  //       zeaznLogger.w(log.getMessage());
  //     },
  //     (stats) {
  //       zeaznLogger.w(stats.getTime());
  //     },
  //   ).then(
  //     (session) => zeaznLogger.i(
  //       'Async FFmpeg process started with sessionId ${session.getSessionId()}',
  //     ),
  //   );

  //   return File(outputPath);
  // }

  static String getFileSize({required File file}) {
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;
    return mb.toStringAsFixed(2);
    // return '${mb.toStringAsFixed(2)} MB';
    //print('Size $i: $mb MB');
  }

  // get [MediaInfo] like file, duration, filesize and more...
  static Future<MediaInfo?> getMediaInfo(File file) async {
    return await VideoCompress.getMediaInfo(file.path);
  }

  static Future<(int, int)> getDurationInMinutes(File file) async {
    final mediaInfo = await getMediaInfo(file);
    var date = DateTime.fromMillisecondsSinceEpoch(
      mediaInfo!.duration!.toInt(),
    );
    zeaznLogger.d('${date.hour}:${date.minute}:${date.second}');
    return (date.minute, date.second);
  }
}
