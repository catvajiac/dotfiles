#!/usr/bin/env python3

import os


HOME = os.path.expanduser('~')
PWD = os.getcwd()
NOTIFYD = HOME + '/.config/notifyd/scripts/'
BIN = HOME + '/.local/bin/'
DOT = HOME + '/.'


def link_file(src, dest):
    if os.path.exists(dest) or os.path.islink(dest):
        print('removing {}...'.format(dest))
        os.popen('rm {}'.format(dest))

    print('linking {} to {}...'.format(src, dest))
    os.popen('ln -s {} {}'.format(src, dest))


def link_directory(directory, file_paths, path=HOME+'/'):
    for filename in os.listdir(directory):
        src = '/'.join([PWD, directory, filename])
        dest = file_paths[filename] if filename in file_paths else path + filename
        link_file(src, dest)


if __name__ == '__main__':
    # parse config
    file_paths = {}
    with open('paths.conf', 'r') as f:
        for line in f:
            src, dest = line.split()
            file_paths[src] = os.path.expanduser(dest)

    # link all files in respective directories
    link_directory('scripts', file_paths, path=BIN)
    link_directory('rc_files', file_paths, path=DOT)

    link_file(NOTIFYD + 'notifyd-toggle.sh', BIN + 'toggle_notifications')
