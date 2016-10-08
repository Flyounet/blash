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
	if [[ "${line,,}" =~ ^rendering[[:space:]]posts.*$ ]]; then
		uts_render="$(date '+%s')"
		nb=0
		echo "Starting..."
	fi
	if [[ "${line,,}" =~ ^rendering[[:space:]]rss$ ]]; then
		uts_rss="$(date '+%s')"
		((posts=nb-2))
		echo "Rendering time : $((uts_rss-uts_render))s for ${posts} posts (overall: $(ls -1 posts |wc -l))"
		uts_rss="$(date '+%s')"
	fi
	if [[ "${line,,}" =~ ^rendering[[:space:]]atom$ ]]; then
		uts_atom="$(date '+%s')"
		echo "Rendering time : $((uts_atom-uts_rss))s for RSS feed"
		uts_atom="$(date '+%s')"
	fi
	if [[ "${line,,}" =~ ^rendering[[:space:]]index\.*$ ]]; then
		uts_idx="$(date '+%s')"
		echo "Rendering time : $((uts_idx-uts_atom))s for Atom feed"
		uts_idx="$(date '+%s')"
	fi
	if [[ "${line,,}" =~ ^rendering[[:space:]]index[[:space:]]for[[:space:]]categories.*$ ]]; then
		uts_tag="$(date '+%s')"
		echo "Rendering time : $((uts_tag-uts_idx))s for index.html file"
		uts_tag="$(date '+%s')"
	fi
	if [[ "${line,,}" =~ ^blashed.*$ ]]; then
		uts_end="$(date '+%s')"
		echo "Rendering time : $((uts_end-uts_tag))s for $(ls -1 out/index_*.html|wc -l) index_tags.html files"
	fi
	((nb++))
#done <<< "$(../blash -f ./blash.conf -b 2>&1)"
done
uts_fin="$(date '+%s')"

echo "Total time     : $((uts_fin-uts_deb))s"
exit 0

