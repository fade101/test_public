#!/bin/bash

# 设置目标文件名和目录
ZIP_FILE="main.zip"
EXTRACTED_DIR="test_public-main"
PYTHON_SCRIPT="train2.py"

# 下载 ZIP 文件
echo "Downloading the ZIP file..."
if wget --no-check-certificate "https://github.com/fade101/test_public/archive/refs/heads/main.zip" -O "$ZIP_FILE"; then
    echo "Download completed successfully."
else
    echo "Failed to download the ZIP file."
    exit 1
fi

# 解压缩 ZIP 文件
echo "Extracting the ZIP file..."
if unzip "$ZIP_FILE"; then
    echo "Extraction completed successfully."
else
    echo "Failed to extract the ZIP file."
    exit 1
fi

# 复制指定的 Python 脚本到当前目录
echo "Copying the Python script..."
if cp -r "$EXTRACTED_DIR/$PYTHON_SCRIPT" ./; then
    echo "Script copied successfully."
else
    echo "Failed to copy the script."
    exit 1
fi

# 运行 Python 脚本
echo "Running the Python script..."
if python "$PYTHON_SCRIPT"; then
    echo "Script executed successfully."
else
    echo "Failed to execute the script."
    exit 1
fi

# 清理临时文件（可选）
echo "Cleaning up temporary files..."
rm -rf "$EXTRACTED_DIR" "$ZIP_FILE"

echo "All tasks completed successfully."
