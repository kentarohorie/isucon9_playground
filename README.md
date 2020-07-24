```bash
docker-compose exec web bash

# In web container

cd sql && ./init.sh

rackup -o 0.0.0.0
```
