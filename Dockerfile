FROM docker.io/library/rust:1.67.0 as builder

WORKDIR /build

RUN git clone https://github.com/casey/ord .
ENV RUSTFLAGS="--deny warnings"

# Build ord
RUN cargo build --bin ord --release

FROM docker.io/library/debian:bullseye-slim

WORKDIR /var/lib/ord

# Copy ord binary from build
COPY --from=builder /build/target/release/ord /usr/local/bin

ENV RUST_BACKTRACE=1
ENV RUST_LOG=info

ENTRYPOINT ["ord"]
