#!/bin/bash
curl https://www.youtube.com/channel/UCSyG9ph5BJSmPRyzc_eGC4g/ > teste.html
lista=`grep 'ListItem' teste.html`
#echo $lista
echo $lista | cut -c 22-999999 > texto.txt
#echo $( cat texto.txt | tr "[:space:]*" "\000" ) | jq '.'

#itemListElement[0].item.itemListElement[0].url
ultimo_video=`cat texto.txt | jq '.itemListElement[0].item.itemListElement[0].url'`
echo $ultimo_video

ultimo_video_comentado=`tail -1 videos_comentados.txt`
echo $ultimo_video_comentado

if test "$ultimo_video" = "$ultimo_video_comentado"
then
 echo "Já comentado."
else
 echo "Novo vídeo, você precisa comentar agora."
fi

echo 1 >> videos_comentados.txt

/home/ricardo/som.sh
