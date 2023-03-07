### Stream spotify to rtmp server
This is achieved by runngin spotifyd inside the container which is then streamed using pulseaudio sink and ffmpeg which send the pulseaudio sink output to rtmp server.

#### Example using docker compose
Example is included in `examples/public-stream` which `docker compose`. Two services are run one of which is __ossrs/srs__ docker image which acts as an rtmp server and other is __spotifyd-rtmp__ which sends currently spotifyd pulseaudio sink output to rtmp server.

#### What even do this?
This can be helpful in creating public stream which can be played by anyone and in my case by a discord music bot.

#### What improvements can be made?
Alot of improvements like making this more stable, smaller docker image size and lowering the latency of the final stream.