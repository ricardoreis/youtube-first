#!/bin/bash
echo
echo
echo "ACESSANDO O YOUTUBE"
echo "-------------------"
echo "CANAL: youtube.com/channel/UCSyG9ph5BJSmPRyzc_eGC4g/"
echo
echo "Verificando último vídeo..."
echo
curl https://www.youtube.com/channel/UCSyG9ph5BJSmPRyzc_eGC4g/ > pagina_do_canal
lista=`grep 'ListItem' pagina_do_canal`
#echo $lista
echo $lista | cut -c 22-999999 > texto.txt
#echo $( cat texto.txt | tr "[:space:]*" "\000" ) | jq '.'

#itemListElement[0].item.itemListElement[0].url
ultimo_video=`cat texto.txt | jq '.itemListElement[0].item.itemListElement[0].url'`
echo
echo "ÚLTIMO VÍDEO"
echo $ultimo_video
echo

ultimo_video_comentado=`tail -1 videos_comentados.txt`
echo "ÚLTIMO VÍDEO COMENTADO"
echo $ultimo_video_comentado
echo

if test "$ultimo_video" = "$ultimo_video_comentado"
then
 echo "Já comentado."
else
 echo "Novo vídeo, você precisa comentar agora."
fi

echo 1 >> videos_comentados.txt

/home/ricardo/youtube-first/som.sh
