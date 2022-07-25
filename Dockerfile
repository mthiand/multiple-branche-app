FROM nginx:alpine
RUN apk add -U subversion
LABEL maintainer = "mthiand@docker.com"
