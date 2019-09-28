FROM ioribranford/godot-docker

RUN -v $(pwd):/build/src -v $(pwd)../build:/build/output ioribranford/godot-docker \
/bin/bash -c "godot --export "Linux/X11" /build/output/test --path /build/src"

CMD echo "test"
