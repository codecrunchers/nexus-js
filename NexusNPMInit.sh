NEXUS_URL=$1
CREDS=$2
echo "Sending Requests to $NEXUS_URL using $CREDS"

# Create 3 Blob Stores
curl  -sSkL -X POST -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/BlobStoreNPMGroup.json
curl  -sSkL -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/BlobStoreNPMProxy.json
curl  -sSkL -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/BlobStoreNPMHosted.json

curl  -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/groupNPMBlobStore/run"
curl  -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/proxyNPMBlobStore/run"
curl  -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/hostedNPMBlobStore/run"


#Create Private, Hosted & Group Reg  
curl -sSkL -X POST -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/NPMRegsitries.json
curl -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/npmregsetup/run"

#Raw Blobs for Release
curl  -sSkL -X POST -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/BlobStoreRawReleases.json
curl  -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/ReleasesBlobStore/run"

#Raw Registry for release artefacts
curl -sSkL -X POST -u $CREDS --header "Content-Type: application/json" "$1/service/siesta/rest/v1/script" -d @scripts/RAWRegsitries.json
curl -sSkL -X POST -u $CREDS --header "Content-Type: text/plain" "$1/service/siesta/rest/v1/script/rawregsetup/run"






