VPGAME DOCKER PHP DEV ENV
============================
代码参考自:https://github.com/YuHaibo/vp-docker-php-dev-env.git

For VPGAME use only.


## Quick Start

1. 使用详情：http://confluence.vpgame.cn/pages/viewpage.action?pageId=13929148

2.  Run

	```
	cd YOUR_PROJECT_PATH
	git git@git.vpgame.cn:dockerfile/php.git
	cd php
	docker-compose up -d
	```
	
3. Edit `/etc/hosts` & Add

	```
	# Lumen project
	127.0.0.1 api.local.vpgame.cn
	127.0.0.1 api71.local.vpgame.cn
	
	# Yii project
	127.0.0.1 www.local.vpgame.cn
	127.0.0.1 yii-webapi.local.vpgame.cn
	127.0.0.1 webapi.local.vpgame.cn
	127.0.0.1 passport.local.vpgame.cn
	127.0.0.1 admin.local.vpgame.cn
	127.0.0.1 aditem.local.vpgame.cn
	```

## TODO
1. xdebug
2. xhprof
3. ...


## License
[WTFPL](http://www.wtfpl.net/txt/copying/)