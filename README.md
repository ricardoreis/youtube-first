# youtube-first
~~Bot to comment "First" on YouTybe videos.~~<br>
The initial goal of this script was to make a robot that would post "First" in video comments recently posted on a youtube channel. But I don't think that will be possible (at least with my current knowledge).

<h2>How it works</h2>

The script is monitoring the last videos page of a channel on youtube.<br>
Every 1 minute the script checks whether the channel has published a new video or not.<br>
If a new video is published, the script will identify and open the browser with the video's URL.<br>
