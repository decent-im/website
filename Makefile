deploy-local:
	rsync -av --delete \
		--exclude=.git --exclude=xmpp-account-exporter --exclude=.gitmodules --exclude=README.md \
		.build/  ../decent-im.github.io/

deploy-prod: deploy-local
	rsync -av --delete \
		--exclude=.git --exclude=xmpp-account-exporter --exclude=.gitmodules --exclude=README.md  \
		../decent-im.github.io/  decent.im:/var/www/html/

