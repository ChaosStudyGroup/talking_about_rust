.PHONY: deploy

init:
	git worktree remove -f /tmp/talkbook
	git worktree add -f /tmp/talkbook gh-pages

deploy: init
	@echo "====> deploying to github"
	mdbook build
	rm -rf /tmp/talkbook/*
	cp -rp book/* /tmp/talkbook/
	cd /tmp/talkbook && \
		git add -A && \
		git commit -m "deployed on $(shell date) by ${USER}" && \
		git push -f origin gh-pages