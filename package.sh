VERSION=$(jq -r ".version" src/manifest.json)

mkdir -p builds/$VERSION
cd src
zip -r ../builds/$VERSION/out.zip ./*
cd ../builds/$VERSION
mv out.zip $VERSION.zip
chromium --pack-extension=$(readlink -f ../../src) --pack-extension-key=$(readlink -f ../../key.pem)
mv ../../src.crx $VERSION.crx
cp $VERSION.zip ../../extension.zip
cd ../..
