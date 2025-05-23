#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://raw.githubusercontent.com/StevenBlack/hosts/master/data/add.Risk/hosts
  https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
  https://www.stopforumspam.com/downloads/toxic_domains_whole.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/dyndns.txt
  https://raw.githubusercontent.com/RPiList/specials/master/Blocklisten/malware
  https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/malware/domains
  https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Hosts/GoodbyeAds.txt
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
