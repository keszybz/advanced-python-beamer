import pyinotify
import os

def follow(file):
    wm = pyinotify.WatchManager()
    notifier = pyinotify.Notifier(wm, pyinotify.ProcessEvent())
    wm.add_watch(file.name, pyinotify.IN_MODIFY)

    file.seek(0, os.SEEK_END)
    while True:
        line = file.readline()
        if not line:
            notifier.check_events()
            continue
        yield line
