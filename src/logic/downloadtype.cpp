#include "downloadtype.h"

#include <QRegularExpression>

DownloadType::Type DownloadType::determineType(const QString& linkOrPath)
{
    const QRegularExpression torrentRx(".*\\.torrent$");
    const QRegularExpression magnetRx("^magnet:");
    const QRegularExpression webUrlRx("^https?://");
    const QRegularExpression fileRx("^[a-z]:[\\\\/]|^/|^~/|^file://", QRegularExpression::CaseInsensitiveOption);

    // first priority of this check is presence of "http",
    // then check for ".torrent"
    // after that may check the rest...
    if (linkOrPath.contains(webUrlRx))
    {
        return RemoteUrl;
    }
    if (linkOrPath.contains(torrentRx))
    {
        return TorrentFile;
    }
    if (linkOrPath.contains(magnetRx))
    {
        return MagnetLink;
    }
    if (linkOrPath.contains(fileRx))
    {
        return LocalFile;
    }

    return Unknown;
}
