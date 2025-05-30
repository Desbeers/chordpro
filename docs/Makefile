#! /bin/make -f

HUGO = hugo
ifeq ($(shell git branch --show-current),dev)
TARGET = beta
else
HUGO += --environment=stable
TARGET = chordpro
endif
HUGO += --baseURL=https://www.chordpro.org/${TARGET}/

site :: build pagefind

build :: assets
	${HUGO}
	mv public/index.html public/allpages/index.html
	cp public/home/index.html public/

publish ::
	rsync -rlpgocHi --delete public/ chordpro-site:www/${TARGET}/

clean ::
	rm -fr public resources

# For development.
server: popup serve

serve :: assets
	( sleep 3; xdg-open  http://${HOSTNAME}:1313 ) &
	${HUGO} server --disableFastRender --navigateToChanged --bind ${HOSTNAME} --baseURL http://${HOSTNAME}:1313

assets ::
	cp ../lib/ChordPro/res/config/chordpro.json assets/pub/chordpro_json.txt

pagefind ::
	pagefind
	rsync -avH public/pagefind/ public/js/

popup ::
	( sleep 5; xdg-open  http://${HOSTNAME}:1313/ ) &
	
macos: assets
	# A target to run the server on macOS as 'localhost' because it is more restrictive
	( sleep 3; open  http://localhost:1313 ) &
	${HUGO} server --baseURL=http://localhost/ --disableFastRender --navigateToChanged
