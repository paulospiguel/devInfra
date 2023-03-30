dockerBuilder:
	  docker-compose up -d --build

dockerDown:
	  docker-compose down

dockerUp:
	  docker-compose up -d

dockerRestart:
	  docker-compose down && docker-compose up -d

dockerLogs:
	  docker-compose logs $(app) -f

dockerAppStop:
	  docker-compose stop $(app)