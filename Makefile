#
# @Author: sejal chougule 
# @Date: 2018-05-02 17:21:41 
# @Last Modified by:   sejal chougule 
# @Last Modified time: 2018-05-02 17:21:41 
# 

run: clean
	node index.js

deploy:
	@echo "Deploying server to cloud"

test:clean
	@echo "Testing server api"

clean:
	@echo "\n -> Cleaning cache and log files\n" 
	-find . -name 'nohup.out' -delete
	@echo "\n -> Cleaning done\n"

help:
	@echo "\nPlease call with one of these targets:\n"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F:\
        '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}'\
        | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs | tr ' ' '\n' | awk\
        '{print "    - "$$0}'
	@echo "\n"	