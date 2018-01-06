RevealJS-Docker
===============

A dockerized version of the [Reveal JS](http://lab.hakim.se/reveal-js/#/) presentation software. To try it out, just do:

```
  docker-compose up -d
```

And open a browser to `http://localhost:8000`. Alternatively, there is a
`run.sh` script for use without Docker compose.

To use your own slides, replace `/slides/slides.md` with your own slides in
Markdown format.

If you need to include other files e.g. images, keep them with the presentation
file and add them in the `slides` directory. As the image runs as the "slides"
user for security, you may need to run `chmod go+r` on files.

If you need to change some options or change the theme, update the files in the
`docker/revealjs-files` directory and rebuild the image:

```
  VCS_REF=$(git rev-parse HEAD) BUILD_DATE=$(date -u +”%Y-%m-%dT%H:%M:%SZ”) docker-compose build
```

Create the directory structure like below and start your presentation with docker-compose
```
  .
  ├── docker-compose.yml
  ├── revealjs-files
  └── slides
      └── slides.md

  #> cat docker-compose.yml
  version: '3'
  services:
    revealjs:
      image: revealjs:1.0.0
      ports:
        - "8000:8000"
        - "35729:35729"
      volumes:
        - ./slides:/revealjs/slides:ro
        - ./revealjs-files:/revealjs-files:ro

  #> docker-compose up
```

This project is *heavily* based on [Peter Parente's revealjs](https://github.com/parente/dockerfiles/tree/master/revealjs). This differences are that this version has an updated Dockerfile which uses the NodeJS official image and removes a problematic VOLUME command.

[![](https://images.microbadger.com/badges/image/amouat/revealjs.svg)](https://microbadger.com/images/amouat/revealjs "Get your own image badge on microbadger.com")

Roadmap
-------
- Make Dockerfile "multistage", like described here -- https://codefresh.io/blog/node_docker_multistage/
- Run `grunt test` for revealjs during image build
- Check if `revealjs-files` exists in the `init.sh`
