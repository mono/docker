#!/bin/bash
set -e

declare -A aliases
aliases=(
	[4.6.1.3]='4.6.1 4.6 4 latest'
	[4.6.0.245]='4.6.0'
	[4.4.2.11]='4.4.2 4.4'
	[4.4.1.0]='4.4.1'
	[4.4.0.182]='4.4.0'
	[4.2.4.4]='4.2.4 4.2'
	[4.2.3.4]='4.2.3'
	[4.2.2.30]='4.2.2'
	[4.2.1.102]='4.2.1'
	[4.0.5.1]='4.0.5 4.0'
	[3.12.1]='3.12.0 3.12 3'
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
