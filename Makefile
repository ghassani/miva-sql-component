MVC=$(shell which mvc)
CLAGS='-W all -p all'

all: default console
deploy: default console _deploy

default:
	$(MVC) $(CFLAGS) sql-queries.mv

console:
	$(MVC) $(CFLAGS) sql-query-console.mv

_deploy:
	cp -p sql-queries.mvc $(MODULE_DEPLOY_DESTINATION)/modules/component/
	cp -p sql-query-console.mvc $(MODULE_DEPLOY_DESTINATION)/modules/util/
	
clean:
	rm -f *.mvc