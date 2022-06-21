# Command to run

`ruby path_to_script path/to/text/file.txt your/from/path your/to/path`

# --dryrun
add `--dryrun` to the end of the command to see what the output will be, without copying the files

# Example setup:

```
My-Cool-Folder/
├── from/
│   ├── 010101-383.png
│   ├── 010101-383.jpg
│   ├── 010101-383.bmp
│   ├── 011111-333.png
│   └── 333333-333.jpg
├── to/
├── script.rb
└── filenames.txt
```

Commands to run for example setup:

`cd path/to/My-Cool-Folder`

`ruby script.rb filenames.txt from to --dryrun`

`ruby script.rb filenames.txt from to`
