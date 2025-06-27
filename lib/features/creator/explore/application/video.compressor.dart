import 'dart:io';

// import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:video_compress/video_compress.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class PVideoCompressor {
  PVideoCompressor._();

  // returns the compressed file
  static Future<File> compressVideo({
    required File videoFile,
    int? duration,
  }) async {
    try {
      //await VideoCompress.setLogLevel(0);
      var result =
          duration == null
              ? await VideoCompress.compressVideo(
                videoFile.path,
                quality: VideoQuality.DefaultQuality,
                deleteOrigin: true,
              )
              : await VideoCompress.compressVideo(
                videoFile.path,
                quality: VideoQuality.DefaultQuality,
                deleteOrigin: true,
                startTime: 0, // customize start time
                duration: duration, // customize the length
              );

      return result!.file!;
    } catch (err) {
      VideoCompress.cancelCompression();
      zeaznLogger.e('Error compressing: ${err.toString()}');
      return videoFile; // return original file if compression fails
    }
  }

  // static Future<String> convertVideoToGif({required File videoFile}) async {
  //   // const basePath = '/storage/emulated/0/Download/';
  //   final basePath =
  //       await getTemporaryDirectory(); // '/data/user/0/com.matchesy.app.matchesy/cache/';

  //   final outputFile =
  //       '${basePath.path}/${DateTime.now().millisecondsSinceEpoch}.gif';
  //   String command =
  //       //'-i ${videoFile.path} -vf scale=500:0 -t 10 -r 10 $outputFile';
  //       '-i ${videoFile.path} -vf scale=320:-1 -t 5 -r 7 $outputFile';

  //   await FFmpegKit.execute(command)
  //       .then((session) async {
  //         final returnCode = await session.getReturnCode();
  //         if (ReturnCode.isSuccess(returnCode)) {
  //           zeaznLogger.d('Task completed');
  //         } else if (ReturnCode.isCancel(returnCode)) {
  //           zeaznLogger.w('Task cancelled');
  //         } else {
  //           zeaznLogger.e('An error occurred');
  //         }
  //       })
  //       .catchError((err) {
  //         zeaznLogger.e('Error: $err');
  //       });
  //   return outputFile;
  // }

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
  //       // matchesyLogger.w(log.getMessage());
  //     },
  //     (stats) {
  //       //matchesyLogger.w(stats.getTime());
  //     },
  //   ).then(
  //     (session) => debugPrint(
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
