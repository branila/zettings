#!/bin/bash

# Access the full path using ZED_FILE
full_path="$ZED_FILE"

# Extract filename with extension
filename_ext=$(basename "$full_path")

# Extract filename and extension
filename="${filename_ext%.*}"
extension="${filename_ext##*.}"

echo "[running $filename_ext]"

if [[ "$extension" == "cpp" ]]; then
    clang++ "$full_path" -o "$filename" && ./"$filename";
elif [[ "$extension" == "go" ]]; then
    go run "$full_path";
elif [[ "$extension" == "js" ]]; then
    node "$full_path";
elif [[ "$extension" == "rs" ]]; then
    cargo run;
else
    echo "Unsupported file type";
fi
