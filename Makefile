
##################################################
#               RockyLinux用ターゲット           #
##################################################
.PHONY: up-rocky down-rocky

IMAGE_NAME_ROCKY := rocky-dev-box
DOCKERFILE_ROCKY := rocky/Dockerfile
REMOTE_TAG_ROCKY := gnom878/rocky-dev-box:latest
CONTAINER_NAME_ROCKY := devbox-rocky


up-rocky: ## RockyLinuxコンテナを起動
	make build-rocky
	@docker run --rm -it --name $(CONTAINER_NAME_ROCKY) $(IMAGE_NAME_ROCKY)

down-rocky: ## RockyLinuxコンテナを停止して削除
	@docker stop $(CONTAINER_NAME_ROCKY)
	@docker rm $(CONTAINER_NAME_ROCKY)

build-rocky: ## RockyLinuxメージをビルド
	@docker build $(ARGS) -f $(DOCKERFILE_ROCKY) -t $(IMAGE_NAME_ROCKY) .

push-rocky: ## RockyLinuxイメージをpush
	@docker tag $(IMAGE_NAME_ROCKY) $(REMOTE_TAG_ROCKY)
	@docker push $(REMOTE_TAG_ROCKY)

##################################################
#                 Ubuntu用ターゲット              #
##################################################
.PHONY: up-ubuntu down-ubuntu

IMAGE_NAME_UBUNTU := ubuntu-dev-box
DOCKERFILE_UBUNTU := ubuntu/Dockerfile
REMOTE_TAG_UBUNTU := gnom878/ubuntu-dev-box:latest
CONTAINER_NAME_UBUNTU := devbox-ubuntu

up-ubuntu: ## Ubuntuコンテナを起動
	build-ubuntu
	@docker run -it --name $(CONTAINER_NAME_UBUNTU) $(IMAGE_NAME_UBUNTU)

down-ubuntu: ## Ubuntuコンテナを停止して削除
	@docker stop $(CONTAINER_NAME_UBUNTU)
	@docker rm $(CONTAINER_NAME_UBUNTU)

build-ubuntu: ## Ubuntuイメージをビルド
	@docker build $(ARGS) -f $(DOCKERFILE_UBUNTU) -t $(IMAGE_NAME_UBUNTU) .

push-ubuntu: ## Ubuntuイメージをpush
	@docker tag $(IMAGE_NAME_UBUNTU) $(REMOTE_TAG_UBUNTU)
	@docker push $(REMOTE_TAG_UBUNTU)

.PHONY: help

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}'