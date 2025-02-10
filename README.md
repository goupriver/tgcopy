### Send files to telegram without third-party packages.

all you need is the curl package and the tar package (to send entire directories)

- 1. create a bot in telegram using `@BotFather`
- 2. copy `Use this token to access the HTTP API:` and change `CHANGEME` to `botToken` 
- 3. find out your Id using the `@userinfobot` bot and insert it `chatId`
- 4. take the script for yourself
- 5. make it executable using the command `chmod +x tgcopy.sh`
- 6. insert line `alias tgcopy="/root/tgcopy.sh"` into `~/.bashrc`

#### HOW TO USE?

| Action  | Command |
| ------------- | ------------- |
| send one file  | `tgcopy file`  |
| send many files  | `tgcopy file1 file2 file3` |
| send directory | `tgcopy directory` |

- you can also send directories and files together as many as you want.
- the directory will be compressed using `tar`. the file name will be `timestamp`
