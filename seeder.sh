#!/bin/sh
# shellcheck disable=SC2046
export $(cat .env)

bin/ez_coins_api eval EzCoinsApi.Release.seed
