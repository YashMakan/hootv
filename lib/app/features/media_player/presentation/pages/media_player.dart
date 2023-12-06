import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TorrentWebView extends StatefulWidget {
  final String magnetLink;

  const TorrentWebView({super.key, required this.magnetLink});

  @override
  State<TorrentWebView> createState() => _TorrentWebViewState();
}

class _TorrentWebViewState extends State<TorrentWebView> {
  InAppWebViewController? _webViewController;
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    const htmlContent = '''<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>VideoPlayer</title>
    <link rel="stylesheet" href="https://cdn.plyr.io/3.6.2/plyr.css" />
    <script src="https://cdn.plyr.io/3.6.2/plyr.js"></script>
    <script src="https://cdn.jsdelivr.net/webtorrent/latest/webtorrent.min.js"></script>
    <style>
        :root {
            --yourRedColor: #ff0000;
            /* Replace with your desired red color */
        }

        .plyr--full-ui input[type=range] {
            color: var(--yourRedColor);
        }

        .plyr__control--overlaid {
            background: var(--yourRedColor);
        }

        .plyr--video .plyr__control.plyr__tab-focus,
        .plyr--video .plyr__control:hover,
        .plyr--video .plyr__control[aria-expanded=true] {
            background: var(--yourRedColor);
        }

        .plyr__control.plyr__tab-focus {
            box-shadow: 0 0 0 5px rgba(var(--yourRedColor), 0.5);
        }

        .plyr__menu__container .plyr__control[role=menuitemradio][aria-checked=true]::before {
            background: var(--yourRedColor);
        }
    </style>
</head>

<body>
    <video id="video" controls muted></video>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const player = new Plyr('#video');
        });

        const client = new WebTorrent()

        // const torrentId = 'https://webtorrent.io/torrents/sintel.torrent'

        function run(torrentId) {
            client.add(torrentId, function (torrent) {
                const file = torrent.files.find(function (file) {
                    return file.name.endsWith('.mp4')
                })
                file.renderTo("#video", {
                    autoplay: true,
                    muted: true
                })
            })
        }
    </script>
</body>

</html>''';

    return InAppWebView(
      initialData: InAppWebViewInitialData(data: htmlContent, mimeType: 'text/html'),
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      onConsoleMessage: (c, m) {
        debugPrint(m.message);
      },
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
        ),
      ),
      onLoadStop: (controller, url) {
        // Inject JavaScript code to start downloading the torrent
        _loadTorrent(widget.magnetLink);
      },
    );
  }

  Future<void> _loadTorrent(String magnetLink) async {
    if (_webViewController != null) {
      await _webViewController!.evaluateJavascript(source: 'run("$magnetLink");');
    }
  }
}
