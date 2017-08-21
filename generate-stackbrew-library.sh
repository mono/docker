#!/bin/bash
set -e

# we want the current latest version, one minor version before that
# and the last version before a major version bump
aliases=(
	'5.2.0      -> 5.2.0.215'
	'5.2        -> 5.2.0.215'
	'5          -> 5.2.0.215'
	'5.0.1      -> 5.0.1.1'
	'5.0        -> 5.0.1.1'
	'4.8.0      -> 4.8.0.524'
	'4.8        -> 4.8.0.524'
	'4          -> 4.8.0.524'
	'3.12.0     -> 3.12.1'
	'3.12       -> 3.12.1'
	'3          -> 3.12.1'
	'latest     -> 5.2.0.215'
)

cd "$(dirname "${BASH_SOURCE[0]}")"

versions=( $( ls -d */ | sort -r))
versions=( "${versions[@]%/}" )

echo '# this file is generated via https://github.com/mono/docker/blob/master/generate-stackbrew-library.sh'
echo
echo 'Maintainers: Jo Shields <jo.shields@xamarin.com> (@directhex),'
echo '             Alexander Köplinger <alkpli@microsoft.com> (@akoeplinger)'
echo 'GitRepo: https://github.com/mono/docker.git'

for version in "${versions[@]}"; do

	variants=('')
	if [ -d $version/slim ]; then
		variants+=('-slim')
	fi

	for variant in "${variants[@]}"; do
		commit="$(git log -1 --format='format:%H' -- "$version${variant/-//}")"
		versionAliases=( $version )

		for index in "${aliases[@]}"; do
			if [[ "${index##* -> }" == "$version" ]]; then
				versionAliases+=(${index%% *-> *})
			fi
		done

		tags=""
		for alias in "${versionAliases[@]}"; do
			if [[ "$alias" == "latest" ]] && [[ "$variant" == "-slim" ]]; then  # latest-slim should just be slim
				tags="${tags}slim"
			else
				tags="${tags}${alias}${variant}"
			fi
			tags="${tags}, "
		done
		tags="${tags%, }"

		architectures="amd64, i386, arm32v7"
		if ! grep -q 'wheezy' "$version/Dockerfile"; then architectures+=", arm64v8"; fi

		echo
		echo "Tags: $tags"
		echo "Architectures: $architectures"
		echo "GitCommit: ${commit}"
		echo "Directory: $version${variant/-//}"
	done

done
