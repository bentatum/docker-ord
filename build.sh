docker buildx build \
    --platform linux/arm64 \
    --tag bentatum/ord:dev \
    --output "type=registry" .
