# honkdev/rails: HONK's Ruby on Rails Docker Image

Our Customized Docker image we use as our `FROM` image.

## Config:

Supports configurations Similar to the Following:

- Ruby 2.3.X (Installed @ 2.3.1p112)
- Rails 4.2.X (Installed @ 4.2.7.1)
- Bundler 1.13.X (Installed @ 1.13.6)
- Nginx 1.10.X (Installed @ 1.10.0)
- NodeJS 6.X (Installed @ 6.9.1)
- Rsyslog 8.X (Installed @ 8.16.0-1ubuntu3)
- Git 2.7.X (Installed @ 2.7.4)

## ONBUILD

This Image declares `ONBUILD` commands for copying Gemfiles and bundle installing for your application in production mode

## Addt'l:

Additional Dependencies Installed (See Dockerfile for complete list of apt-get packages)