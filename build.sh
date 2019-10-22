curl https://raw.githubusercontent.com/gyselroth/balloon/master/README.md > docs/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon/master/CHANGELOG.md > docs/server/changelog.md
curl https://raw.githubusercontent.com/gyselroth/balloon/master/UPGRADE.md > docs/server/upgrade.md
curl https://raw.githubusercontent.com/gyselroth/balloon/master/CONTRIBUTING.md > docs/server/contribute.md
curl https://raw.githubusercontent.com/gyselroth/balloon/master/README.md > docs/server/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon-client-web/master/CHANGELOG.md > docs/web-client/changelog.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-web/master/UPGRADE.md > docs/web-client/upgrade.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-web/master/CONTRIBUTING.md > docs/web-client/contribute.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-web/master/README.md > docs/web-client/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon-client-desktop/master/CHANGELOG.md > docs/desktop-client/changelog.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-desktop/master/UPGRADE.md > docs/desktop-client/upgrade.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-desktop/master/CONTRIBUTING.md > docs/desktop-client/contribute.md
curl https://raw.githubusercontent.com/gyselroth/balloon-client-desktop/master/README.md > docs/desktop-client/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon-sdk-go/master/README.md > docs/sdk/go/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon-sdk-typescript-node/master/README.md > docs/sdk/nodejs/index.md

curl https://raw.githubusercontent.com/gyselroth/balloon-sdk-php/master/README.md > docs/sdk/php/index.md
git clone https://github.com/gyselroth/balloon-sdk-php
cp -Rpv balloon-sdk-php/docs/* docs/sdk/php/
rm -rfv balloon-sdk-php

find docs -name \*.md -exec sed 's/\\$/<br\/\>/g' -i {} \;

mkdocs gh-deploy
