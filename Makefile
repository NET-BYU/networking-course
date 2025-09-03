default: develop

install:
	bundle install

develop: install
	bundle exec jekyll serve --livereload

build: install
	bundle exec jekyll build

check_links: build
	bundle exec htmlproofer --ignore_empty_alt --ignore_missing_alt --swap-urls "^\/426:" --allow_missing_href --ignore-status-codes "0,301,403,999" ./_site
