# YouTube → MP3 Downloader

A simple Windows batch script for downloading YouTube videos as **MP3 files at 320 kbps** using [yt-dlp](https://github.com/yt-dlp/yt-dlp) and FFmpeg.

## 📁 Files

```text
.
├── install.bat
├── download_mp3.bat
└── links.txt
```

### `install.bat`

Automatically installs the required programs:

* **yt-dlp** — downloads the audio from YouTube
* **FFmpeg** — converts the audio to MP3

The installer uses **winget**, which is included with modern versions of Windows.

### `links.txt`

Put the YouTube URLs you want to download in this file.

Example:

```text
https://www.youtube.com/watch?v=Aq5WXmQQooo
https://www.youtube.com/watch?v=XXXXXXXXXXX
https://www.youtube.com/watch?v=YYYYYYYYYYY
```

One URL per line.

### `download_mp3.bat`

Reads all URLs from `links.txt` and downloads them as MP3 files.

The downloaded files are saved in:

```text
MP3/
```

The output filename is automatically based on the YouTube video title.

## 🚀 Installation

### 1. Download the repository

Clone the repository:

```bash
git clone https://github.com/Bo-Br/audio_download_script.git
cd audio_download_script
```

Or download the repository as a ZIP file and extract it.

### 2. Install the requirements

Run:

```text
install.bat
```

The script will install:

* FFmpeg
* yt-dlp

If `winget` is not available, install **App Installer** from the Microsoft Store and run `install.bat` again.

### 3. Add YouTube links

Open:

```text
links.txt
```

Add your URLs, one per line.

For example:

```text
https://www.youtube.com/watch?v=Aq5WXmQQooo
https://www.youtube.com/watch?v=XXXXXXXXXXX
```

### 4. Download the MP3 files

Run:

```text
download_mp3.bat
```

The script will process every URL in `links.txt`.

Your MP3 files will appear in:

```text
MP3/
```

## ⚙️ Features

* 🎵 MP3 output
* 🔊 320 kbps audio quality
* 📋 Multiple URLs supported
* 📁 Automatic `MP3` output folder
* 🏷️ Uses the YouTube video title as the filename
* 🚫 Does not download playlists
* ⚡ Simple Windows `.bat` scripts

## 🖥️ Requirements

* Windows 10 or Windows 11
* `winget`
* Internet connection

`install.bat` installs the remaining dependencies automatically.

## ⚠️ Notes

The downloader uses `yt-dlp` and FFmpeg. Make sure you comply with YouTube's Terms of Service and applicable copyright laws when downloading content.

Only download content that you have permission or legal rights to download.

## 📄 License

Choose a license appropriate for your project. If you don't need to restrict usage, the **MIT License** is a simple option.
