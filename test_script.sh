#!/usr/bin/env bash

if [[ "x$1" == "x" ]]; then echo "You must supply the memory to use (first arg)"; exit 1; fi
if [[ "x$2" == "x" ]]; then echo "You must supply the OS you are on (second arg)"; exit 1; fi

# Clean current version from caches
rm -rf ~/.gradle/caches/minecraft/net/minecraftforge/forge/1.11-13.19.1.2199
cmd='GRADLE_OPTS=-Xmx'"${1}"'G ./gradlew setupDecompWorkspace --info --no-daemon'
(echo "$ $cmd" && eval "$cmd" ) | tee "${2}"_memory_"${1}"G.txt
