deploy-local:
	rsync -av --delete \
		--exclude=.git --exclude=xmpp-account-exporter --exclude=.gitmodules --exclude=README.md \
		.build/  ../decent-im.github.io/
	cd ../decent-im.github.io/ && git add . && GIT_PAGER=cat git diff --cached --color=always

deploy-prod: deploy-local
	rsync -av --delete \
		--exclude=.git --exclude=xmpp-account-exporter --exclude=.gitmodules --exclude=README.md  \
		../decent-im.github.io/  decent.im:/var/www/html/

cactus-container-build:
	podman build -f Dockerfile --tag cactus .

enter-cactus:
	#podman run --security-opt label=disable --rm -v ${PWD}:/my -p8000:8000 -it python:2.7 /bin/bash -c "pip install cactus; cd my; bash -i"
	podman run --security-opt label=disable --rm -v ${PWD}:/my -p8000:8000 -it --workdir /my  cactus /bin/bash

build:
	cactus build
