import argparse
import os
import shutil


def get_directory_size(start_path):
    total_size = 0
    for path, dirs, files in os.walk(start_path):
        for f in files:
            fp = os.path.join(path, f)
            total_size += os.path.getsize(fp)
    return total_size


def rmrf(path):
    print('Removing {}'.format(path))
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path)
    elif os.path.exists(path):
        os.remove(path)


def remove_old_files(start_path, size_to_remove):
    dirs = {}
    for f in os.listdir(start_path):
        fp = os.path.join(start_path, f)
        dirs[str(int(os.path.getmtime(fp)))] = {
            'path': fp,
            'size': get_directory_size(fp) if os.path.isdir(fp) else os.path.getsize(fp)
        }

    times = list(dirs.keys())
    times.sort()
    removed_size = 0
    for t in times:
        if removed_size > size_to_remove:
            break
        rmrf(dirs[t]['path'])
        removed_size += dirs[t]['size']

    return removed_size


argparser = argparse.ArgumentParser()
argparser.add_argument('directory')
argparser.add_argument('max_size', type=int)
args = argparser.parse_args()
DIRECTORY_PATH = args.directory
MAX_DIRECTORY_SIZE = args.max_size

directory_size = get_directory_size(DIRECTORY_PATH)
if directory_size > MAX_DIRECTORY_SIZE:
    removed_size = remove_old_files(DIRECTORY_PATH, directory_size - MAX_DIRECTORY_SIZE)
    print('Bytes deleted: {}'.format(removed_size))
else:
    print('Nothing to delete')
