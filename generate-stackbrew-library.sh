#!/bin/bash
set -e

declare -A aliases
aliases=(
	[3.12.0]='3.12 3 latest'
	[3.10.0]='3.10'
	[3.8.0]='3.8'
)

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/mono/docker'

echo '# maintainer: Jo Shields <jo.shields@xamarin.com> (@directhex)'

for version in "${versions[@]}"; do
	commit="$(git log -1 --format='format:%H' -- "$version")"
	versionAliases=( $version ${aliases[$version]} )
	
	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done
	
	for variant in onbuild; do
		commit="$(git log -1 --format='format:%H' -- "$version/$variant")"
		echo
		for va in "${versionAliases[@]}"; do
			if [ "$va" = 'latest' ]; then
				va="$variant"
			else
				va="$va-$variant"
			fi
			echo "$va: ${url}@${commit} $version/$variant"
		done
	done
done
