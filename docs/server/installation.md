# Installation

This is a step-by-step tutorial how to correctly deploy the balloon server and the [balloon web](github.com/gyselroth/balloon-client-web) based user interface.
This tutorial includes the web interface, of course you may also just install the server components only. The web ui acts as a balloon client and is completely optional.

There are multiple supported ways to deploy balloon:

* Docker (docker-compose)
* [Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/) using [helm](https://github.com/gyselroth/balloon-helm)
* Manually to [Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/)
* Manually from tar archive
* Compile manually from scratch

>**Note** The distribution of deb packages has been [discontinued](https://github.com/gyselroth/balloon/issues/415) starting with balloon v2.7 in favor of docker-composer.

## Docker (docker-compose)

The easiest and fastest way to deploy a balloon environment is to spin it up using docker and docker-compose.
Since the installation is not the same for different host os and docker can be started on Linux, Windows and Mac please visit 
the docker documentation on how to install [docker](https://docs.docker.com/install) and [docker-compose](https://docs.docker.com/compose/install).

**Requirements**:

* docker
* docker-compose
* curl

```
mkdir balloon; cd balloon
curl https://raw.githubusercontent.com/gyselroth/balloon/master/packaging/docker-compose/docker-compose.yaml > docker-compose.yaml
docker-compose up
```

>**Note** All balloon containers provide a version tag besides `latest`. It is best practice to use an exact version of a service instead the latest tag in production environment.
The containers provide a `latest-unstable` tag for the balloon-jobs, balloon and balloon-web container. It is in no way reccomened to use pre-releases in production environments! 
If you want to install beta and alpha versions replace `latest` with `latest-unstable` or specify an exact version tag. Pre-releases are only ment for testing purposes and are in no way recommended in production environements!


The balloon web interface is now available at `http://localhost`.

Username: admin <br/>
Password: admin <br/>

## Deploy on kubernetes (helm)

See the complete documentation for balloon helm [here](https://github.com/gyselroth/balloon-helm).

To install the chart with the release name `my-release`:

```console
helm repo add balloon https://gyselroth.github.io/balloon-helm/stable
helm install balloon/balloon --name my-release --namespace mynamespace
```

Example deployment with ingress/tls enabled:

```console
helm install balloon/balloon --name my-release --namespace mynamespace <br/>
    --set balloon-proxy.ingress.enabled=true \ 
    --set balloon-web.ingress.enabled=true \ 
    --set balloon-proxy.ingress.host=balloon.local <br/>
    --set balloon-web.ingress.host=balloon.local <br/>
    --set balloon-web.ingress.tls[0].secretName=tls-balloon.local <br/>
    --set balloon-proxy.ingress.tls[0].secretName=tls-balloon.local <br/>
    --set balloon.url=https://balloon.local
```

## Deploy on kubernetes (manually)

>**Note** Using helm to deploy balloon on kubernetes is the preferred way.


## Manually install from source

This topic is only for advanced users who know what the do or developers and describes how to deploy balloon by installing it directlly from source.
If you are a developer please also continue reading [this](https://github.com/gyselroth/balloon/blob/master/CONTRIBUTING.md) article.

**Requirements**:

* posix based operating system (Basically every linux/unix)
* make
* [comoser](https://getcomposer.org/download/)
* git
* php >= 7.3
* php ext-mongodb
* php ext-curl
* php ext-mbstring
* php ext-intl
* php ext-zip
* php ext-posix
* php ext-pnctl
* php [ext-smd5](https://github.com/gyselroth/php-serializable-md5)
* php-fpm
* nginx

* MongoDB Server >= 3.4

**Optional requirements**:

* php ext-apc (Used in \Micro\Auth to cache discovery metadata)
* php ext-imagick (Used in Balloon.App.Preview)
* php ext-ldap (Used for LDAP authentication adapter in Micro\Auth)
* php ext-smb (Used for SMB external storage)
* smbclient (Used for SMB external storage)

* Elasticsearch >= 6.0 (Used by Balloon.App.Elasticsearch)
* Libreoffice online >= 4.0.9 (Used by Balloon.App.Office and Balloon.App.Wopi)
* ClamAV (Used by Balloon.App.Clamav)

### Install balloon server
```sh
git clone https://github.com/gyselroth/balloon.git
cd balloon
make install
```
