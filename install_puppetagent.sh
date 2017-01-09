echo "enter the name of the resource group...you like to pupetize"
read rg
for machine in $(azure vm list $rg  --json  | jq -r .[].name)
do
   azure vm extension set $rg $machine CustomScript Microsoft.Azure.Extensions 2.0 --auto-upgrade-minor-version --public-config-path ./install-puppetagent.json
done
