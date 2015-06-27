# hubot-starter-kit

Everything you need to get started with [Hubot](https://github.com/github/hubot).

## What's included?

* Automated workflow (external-scripts.json regeneration on npm postinstall, 
automatic reload on script changes, etc). 
* Dockerfile which you can use to build your own custom Docker image (Dockerfile.ARMv7 for your Raspberry PI 2).
* [Skype](https://github.com/shyiko/hubot-skype-over-phantomjs)* / [HipChat](https://github.com/hipchat/hubot-hipchat) / [Slack](https://github.com/slackhq/hubot-slack) adapters. 
* Redis brain.

> \* Depends on [PhantomJS](http://phantomjs.org/) being installed and 
    available on the PATH.
 
Add/remove stuff to suit your needs. 

## Development
 
> PREREQUISITES: Git, Node, NPM. Also, if you don't have CoffeeScript installed - run `npm install -g coffee-script`.  
 
```sh
git clone https://github.com/shyiko/hubot-starter-kit && cd hubot-starter-kit 
npm install
npm run start-dev 
```

> `npm run start-dev` loads shell adapter by default. If you want another 
 one (say HipChat) then `npm install hubot-hipchat --save && HUBOT_HIPCHAT_JID=<id> HUBOT_HIPCHAT_PASSWORD=<password> npm run start-dev -- --adapter hipchat`

## Building Docker image

```sh
docker build -t shyiko/hubot .
```

> ... or `docker build -f Dockerfile.ARMv7 -t shyiko/hubot .` for ARMv7.  

## Deploying 

```sh
docker run --name hubot-redis-brain -d redis:3.0.1 redis-server --appendonly yes # data volume - /data
docker run --name hubot --link hubot-redis-brain:redis \
  -e REDIS_URL=redis://redis:6379/hubot \
  -e HUBOT_SKYPE_USERNAME=<microsoft_account> \
  -e HUBOT_SKYPE_PASSWORD=<password> \
  -d shyiko/hubot --adapter skype-over-phantomjs
```

> ... on ARMv7 replace `redis:3.0.1` with `shyiko/armv7-redis`. 

> You can check Hubot logs with `docker logs -f hubot`.

## License

[MIT](https://github.com/shyiko/hubot-starter-kit/blob/master/mit.license)
