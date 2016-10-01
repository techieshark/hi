
server:
	 python GzipSimpleHTTPServer.py --encoding=gzip

ngrok: 
	ngrok http 8000

mincss:
	cd css && cat normalize.css main.css | cleancss -o min.css

# node install -g html-minifier
# options based on config at http://kangax.github.io/html-minifier/ except remove-tag-whitespace isn't used
# since it makes invalid html
minhtml:
	html-minifier --collapse-boolean-attributes --collapse-whitespace --decode-entities --html5 --minify-css --minify-js --process-conditional-comments --remove-attribute-quotes --remove-comments --remove-empty-attributes --remove-optional-tags --remove-redundant-attributes--remove-script-type-attributes --remove-style-link-type-attributes --sort-attributes --sort-class-name --use-short-doctype index.src.html -o index.html

# postcss -c options.json
build:
	# uncss --ignore /slide/,/shadowSquiggle/ index.html > css/un.css
	# uncsss doesn't work w/ animation lists - https://github.com/giakki/uncss/issues/188 animations
	cp index.src.html index-uncss.html
	sed -e 's/min/stage1/g' -i .bk index-uncss.html

	cat css/normalize.css css/main.css > css/stage1.css
	uncss index-uncss.html > css/stage2.css

	cat css/stage2.css css/animation.css > css/stage3.css
	postcss -c postcss.json

	make minhtml


clean:
	rm css/stage?.css
	rm index-uncss*

