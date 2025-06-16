# $RULES_WEBHOOK_URL
TOS=$(cat './raw/Terms of Service.txt')
GAMEPLAY=$(cat './raw/Gameplay Rules.txt')

CHAT=$(cat './raw/Chat Rules.txt')
LAG=$(cat './raw/Lag Guidelines.txt')
SUM=$(cat './Summary.txt')
INFO=$(cat './Info.txt')


read -r -d '' MSG1 <<- EOF
{
  "content": null,
  "embeds": [
    {
      "description": "",
      "color": null,
      "image": {
        "url": "https://cdn.discordapp.com/attachments/1217045014257860628/1288227136674594907/farwater_rules__info.png?ex=6851c803&is=68507683&hm=20bb08efed31133d3989649c0609abe636bd3be1c99b0eee5422193d85f5087e&"
      }
    },
    {
      "title": "RULES",
      "description": "${TOS}",
      "color": null,
      "thumbnail": {
        "url": "https://cdn.discordapp.com/attachments/1175474942121357413/1235225034717401181/a_5c1c86063aa8e58c4a5a12cf201c685c.gif?ex=685170f5&is=68501f75&hm=b6d697f8462b16ca4385a858e97a7dae6a95be6bbc455a81ff26160affb9867e&"
      }
    },
    {
      "description": "${GAMEPLAY}",
      "color": null
    }
  ],
  "attachments": []
}
EOF