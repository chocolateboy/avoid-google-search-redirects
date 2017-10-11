# This file is part of Avoid Google Search redirects.
#
# Copyright ⓒ 2017 Adrien Dorsaz <adrien@adorsaz.ch>
#
# Avoid Google Search redirects is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Avoid Google Search redirects is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Avoid Google Search redirects.If not, see <http://www.gnu.org/licenses/>.

PERCENT := %

build:
	zip ../avoid-google-search-redirects.zip -FS -r *

# Look only for country related root TLD
# Suppose that the iana URL give one line by domain with something like <span class="domain tld"><a>.root</a>
get-google-urls:
	curl --silent 'https://www.iana.org/domains/root/db' | \
		grep 'country-code' -B2 | \
		grep 'class="domain tld"' | grep '>\.\w*<\/a>' -o | sed  's/<\/a>//' | sed 's/>//' | \
		xargs -I '{}' /bin/bash -c "if openssl s_client -showcerts --servername www.google{} --connect www.google{}:443 </dev/null 2>&1 | grep --quiet 'depth=0 C = US, ST = California, L = Mountain View, O = Google Inc'; then curl -Ls -o /dev/null -w '$(PERCENT){url_effective}\r\n' -A 'Mozilla/5.0' 'https://www.google{}' >>extern/google.urls ; sleep 5 ; fi"

get-google-matches:
	# Exceptions are manually found by clicking on ever link in extern/google.urls
	egrep -v "(ai.google|google.do|google.gd|google.io|google.kr|google.ph|google.sg|google.tw)" extern/google.urls |\
		sed 's/^https\?/\\"*/' | sed 's/?.*$$//' | sed 's=/\s*$$=/*\\",=' | \
		sort -u | \
		xargs | sed 's/,\s*$$//' >extern/google.matches
