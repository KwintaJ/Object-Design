# Build
FROM debian:stable-slim AS builder
RUN apt-get update && apt-get install -y fpc

WORKDIR /build

COPY 3_0/simpleGenerator.pas .
COPY 3_5/bubbleSort.pas .
COPY 4_0/betterGenerator.pas .
COPY 4_5/unitTesting.pas .

RUN fpc -osimpleGenerator.x simpleGenerator.pas
RUN fpc -obubbleSort.x bubbleSort.pas
RUN fpc -obetterGenerator.x betterGenerator.pas
RUN fpc -ounitTesting.x unitTesting.pas

# Runtime
FROM debian:stable-slim

WORKDIR /home/3_0
COPY --from=builder /build/simpleGenerator.x .

WORKDIR /home/3_5
COPY --from=builder /build/bubbleSort.x .

WORKDIR /home/4_0
COPY --from=builder /build/betterGenerator.x .

WORKDIR /home/4_5
COPY --from=builder /build/unitTesting.x .

WORKDIR /home/app
COPY 5_0/start.sh .

CMD ["./start.sh"]