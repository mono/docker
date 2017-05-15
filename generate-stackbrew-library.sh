#!/bin/bash
set -e

# we want the current latest version, one version before that
# and the last version before a major version bump
aliases=(
	'5.0.0.100  -> 5.0.0 5.0 5 latest'
	'4.8.0.524  -> 4.8.0 4.8 4'
	'3.12.1     -> 3.12.0 3.12 3'
)

cd "$(dirname "${BASH_SOURCE[0]}")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/mono/docker'

echo '# maintainer: Jo Shields <jo.shields@xamarin.com> (@directhex)'
echo '# maintainer: Alexander Köplinger <alkpli@microsoft.com> (@akoeplinger)'

for version in "${versions[@]}"; do
	commit="$(git log -1 --format='format:%H' -- "$version")"
	versionAliases=( $version )

	for index in "${aliases[@]}"; do
		if [[ "${index%% *-> *}" == "$version" ]]; then
			versionAliases+=(${index##* -> })
		fi
	done

	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done

done
