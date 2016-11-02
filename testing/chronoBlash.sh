#!/bin/bash

die() {
	echo "${@}" >&2
	exit 1
}

usage() {
	cat <<-POUET
${0} <number of post>
POUET
	exit 1
}
[[ -z "${@}" || ! -z "${@//[0-9]/}" ]] && usage
[[ ! -f ../blash ]] && die "I can't only work from inside the testing subdirectory, type 'cd $(cd "$(basename "$0")"; pwd )' and execute me again"

uts_deb="$(date '+%s')"
../blash -b ${@} 2>&1 | while read line; do
	# The line starts with a number so it's a post
	if [[ "${line,,}" =~ ^[[:digit:]][[:digit:]]*.*$ ]]; then
		((posts++))
	fi
	if [[ "${line,,}" =~ ^.*loading[[:space:]]posts.*$ ]]; then
		uts_0="$(date '+%s')"
		nb=0
		echo "Starting..."
	fi
	if [[ "${line,,}" =~ ^.*draft[[:space:]]posts.*$ ]]; then
		uts_1="$(date '+%s')"
		posts=0
		echo "Loading time : $((uts_1 - uts_0))s"
	fi
	if [[ "${line,,}" =~ ^.*hidden[[:space:]]posts.*$ ]]; then
		uts_2="$(date '+%s')"
		echo "Draft posts to render ${posts} in $((uts_2 - uts_1))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^.*regular[[:space:]]posts.*$ ]]; then
		uts_3="$(date '+%s')"
		echo "Hidden posts to render ${posts} in $((uts_3 - uts_2))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^.*rss[[:space:]]feed.*$ ]]; then
		uts_4="$(date '+%s')"
		echo "Regular posts to render ${posts} in $((uts_4 - uts_3))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^.*atom[[:space:]]feed.*$ ]]; then
		uts_5="$(date '+%s')"
		echo "RSS feed rendered in $((uts_5 - uts_4))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^.*index[[:space:]]:.*$ ]]; then
		uts_6="$(date '+%s')"
		echo "Atom feed rendered in $((uts_6 - uts_5))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^.*categories[[:space:]]:.*$ ]]; then
		uts_7="$(date '+%s')"
		echo "Index rendered in $((uts_7 - uts_6))s"
		posts=0
	fi
	if [[ "${line,,}" =~ ^blashed.*$ ]]; then
		uts_8="$(date '+%s')"
		echo "Categories rendered in $((uts_8 - uts_7))s"
		posts=0
	fi
	((nb++))
done
uts_fin="$(date '+%s')"

echo "Total time     : $((uts_fin-uts_deb))s"
exit 0

