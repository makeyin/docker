VPGAME DOCKER PHP DEV ENV
============================


For VPGAME use only.


## Quick Start

1. Download & Install Docker

2. Build & Run

	```
	cd YOUR_PROJECT_PATH
	git clone https://github.com/YuHaibo/vp-docker-php-dev-env.git
	cd vp-docker-php-dev-env
	docker-compose build
	docker-compose up -d
	```
	
3. Edit `/etc/hosts` & Add

	```
	# Lumen project
	127.0.0.1 api.local.vpgame.cn
	
	# Yii project
	127.0.0.1 www.local.vpgame.cn
	127.0.0.1 yii-webapi.local.vpgame.cn
	127.0.0.1 webapi.local.vpgame.cn
	127.0.0.1 passport.local.vpgame.cn
	127.0.0.1 admin.local.vpgame.cn
	```

## TODO
1. xdebug
2. xhprof
3. ...


## License
[WTFPL](http://www.wtfpl.net/txt/copying/)