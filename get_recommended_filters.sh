#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts
  https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/gambling/domains
  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/dyndns.txt
  https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hosts
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareDomains.txt
  https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-domains.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/ultimate.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/wildcard.txt
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
