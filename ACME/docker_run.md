```
docker run --rm 
  -v ./out:/acme.sh
  --net=host
  -e REGRU_API_Username="$REGRU_API_Username" 
  -e REGRU_API_Password="$REGRU_API_Password"
  neilpang/acme.sh 
  --issue --dns dns_regru -d domain.com -d *.domain.com --server letsencrypt
```
