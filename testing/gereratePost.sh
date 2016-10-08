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



[[ "${1:-}" =~ ^[0-9]+$ ]] || usage

_path="$( cd "$(dirname "${0}")"; pwd )"
# Some cleaning
cd "${_path}" && rm -rf "./posts" && mkdir "./posts"

# Generate list file and tags
readarray -t posts < <(find "${_path}" -name '*.md')
nbpost=${#posts[@]}
readarray -t cats < <(for i in {1..5}; do echo "cat_${i}"; done)
nbcat=${#cats[@]}

# pseudo initialisation
for ((i=0;i<$RANDOM;i++)); do
	n=$RANDOM
done
uts="$(date '+%s')"
echo "[Info] Nb Posts : ${nbpost} - Nb Tags : ${#cats[@]} - Nb posts to generate : ${1}"
all=0
while [ ${nbpub:=0} -le ${1} ]; do
	# pickup a post
	f="$( basename "${posts[$((RANDOM%${nbpost}))]}" )"; nf="${f}"
	if [[ "${f}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.*$ ]]; then
		nf="${f//[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-/}"
	fi
	nf="$(date -u +%Y-%m-%d --date "- ${all} days")-${nf}" 
	[[ -f "posts/${nf}" ]] && nf="${nf//\.md/-$nbpub.md}"
	if [  $((RANDOM%6 )) -ne 3 ]; then
		nbtags=$((RANDOM%${#cats[@]}))
		if [ ${nbtags} -gt 0 ]; then
			tts=''; ts=''
			while [ ${nbtags} -ne 0 ]; do
				ts="${cats[$((RANDOM%${nbcat}))]}"
				if [ "${tts//$ts/}" = "${tts:=}" ]; then
					[[ ! -z "${tts}" ]] && tts="${tts},"
					tts="${tts}${ts}"
				else
					((nbtags++))
				fi
				((nbtags--))
			done
		fi
	fi
	if [  $((RANDOM%3 )) -eq 1 ]; then
		sed -e 's;^[[:space:]]*draft:[[:space:]]*false[[:space:]]*$;draft: true;g'  "${f}" > "posts/${nf}"
		dr='true'
	else
		sed -e 's;^[[:space:]]*draft:[[:space:]]*true[[:space:]]*$;draft: false;g'  "${f}" > "posts/${nf}"
		dr='false'
		(( nbpub++ ))
	fi
	sed -i -e 's;^[[:space:]]*tags:[[:space:]]*.*$;tags: '"${tts}"';g' "posts/${nf}"
	echo " $f -- $nf"
	echo "draft: ${dr} -- cats:  ${tts}"
	if [ $((RANDOM%5 )) -ne 0 ]; then
		(( all++ ))
	fi
	if [ $((RANDOM%50 )) -eq 0 ]; then
		(( all++ ))
	fi
done
echo $(( RANDOM%${#cats[@]} ))

echo ${#cats[@]}
