COMMIT_HASH="d142f13d8011bb8b11bc90e8d468688a5ee11964"
OUTPUT_DIR="patches"

mkdir -p "$OUTPUT_DIR"

for file in $(git diff --name-only "$COMMIT_HASH" HEAD); do
  # 将文件路径中的 / 替换为 _ 以创建安全的文件名
  patch_filename=$(echo "$file" | tr '/' '_').patch
  
  # 为单个文件生成 patch 并保存
  git diff "$COMMIT_HASH" HEAD -- "$file" > "${OUTPUT_DIR}/${patch_filename}"
done

echo "所有 patch 文件已生成在 '$OUTPUT_DIR' 目录中。"