/// request for ping every 10 seconds
alarm[0] = room_speed * 10;
sio_emit("ping", "");