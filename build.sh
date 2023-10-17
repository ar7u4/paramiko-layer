# Inside your build script (build.sh)
rm -rf layer
docker build -t paramiko-layer .
CONTAINER=$(docker run -d paramiko-layer false)
docker cp $CONTAINER:/opt build
docker rm $CONTAINER
touch build/.slsignore
cat > build/.slsignore << EOF
**/*.a
**/*.la
share/**
include/**
bin/**
EOF

# Inside your build script (build.sh)
# Create a zip file
cd build
zip -r9 paramiko-layer.zip .
