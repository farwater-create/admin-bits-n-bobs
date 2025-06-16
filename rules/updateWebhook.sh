MSG1_ID="1338200781865881651"
TOS=$(cat './raw/Terms of Service.txt')
GAMEPLAY=$(cat './raw/Gameplay Rules.txt')

MSG2_ID="1338200788580827260"
CHAT=$(cat './raw/Chat Rules.txt')
LAG=$(cat './raw/Lag Guidelines.txt')
SUMMARY=$(cat './raw/Summary.txt')
INFO=$(cat './raw/Info.txt')

# ensure it exists
mkdir temp

jq -n \
  --arg tos "${TOS}" \
  --arg gameplay "${GAMEPLAY}" \
  '{
    content: null,
    embeds: [
      {
        description: "",
        color: null,
        image: {
          url: "https://github.com/farwater-create/admin-bits-n-bobs/blob/main/images/farwater_rules_info.png?raw=true"
        }
      },
      {
        title: "RULES",
        description: $tos,
        color: null,
        thumbnail: {
          url: "https://github.com/farwater-create/admin-bits-n-bobs/blob/main/images/farwater_waterwheel_gray_blue.gif?raw=true"
        }
      },
      {
        description: $gameplay,
        color: null
      }
    ],
    attachments: []
  }' > temp/msg1.json
jq -n \
  --arg chat "${CHAT}" \
  --arg lag "${LAG}" \
  --arg summary "${SUMMARY}" \
  --arg info "${INFO}" \
  '{
    content: null,
    embeds: [
      {
        description: $chat,
        color: null
      },
      {
        description: $lag,
        color: null
      },
      {
        description: $summary,
        color: null
      },
      {
        description: $info,
        color: null
      }
    ],
    attachments: []
  }' > temp/msg2.json

WRITE_OUT="%{method} %{url} HTTP/%{http_version}\n%{response_code}\n"
curl -X PATCH \
    -H "Content-Type: application/json" \
    --data @temp/msg1.json \
    --silent --output /dev/null \
    -w "${WRITE_OUT}" \
    "${RULES_WEBHOOK_URL}/messages/${MSG1_ID}"
curl -X PATCH \
    -H "Content-Type: application/json" \
    --data @temp/msg2.json \
    --silent --output /dev/null \
    -w "${WRITE_OUT}" \
    "${RULES_WEBHOOK_URL}/messages/${MSG2_ID}"

# clean up
rm -r temp