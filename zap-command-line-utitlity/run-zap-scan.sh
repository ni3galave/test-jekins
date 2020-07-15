#!/bin/bash

export ZAP_PATH=/opt/asimily/zap/ZAP_2.9.0
export ZAP_PORT=8090
export ZAP_API_KEY=12345

zap-cli open-url https://test-portal.asimily.com
zap-cli spider --context-name defaultContext --user-name admin https://test-portal.asimily.com
#zap-cli quick-scan -l Informational -s all -r -c Prod2May -u admin https://test-portal.asimily.com
#zap-cli active-scan --context-name defaultContext --user-name admin https://test-portal.asimily.com
zap-cli alerts


#Scan status

#curl -s "http://localhost:8090/JSON/alert/view/alertCountsByRisk/?apikey=12345&url=https://test-portal.asimily.com&recurse=True" | jq .

#curl -s "http://localhost:8090/JSON/alert/view/alertsByRisk/?apikey=12345&url=https://test-portal.asimily.com&recurse=True" | jq .

#Download Report
echo " ============== Generating report to /opt/asimily/zap/report/ ========================="
curl -X GET http://localhost:8090/OTHER/core/other/htmlreport/ -H 'Accept: application/json' -H 'X-ZAP-API-Key: 12345' > report.html

echo "Generated new report  to /opt/asimily/zap/report/ direcotry ==========="

echo " ============== Scan Summary =========================================================="
#Report Summary
curl -s "http://localhost:8090/JSON/alert/view/alertCountsByRisk/?apikey=12345&url=https://test-portal.asimily.com&recurse=True" | jq .
