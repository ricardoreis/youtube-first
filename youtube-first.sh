#!/bin/bash
echo
echo "ACESSANDO O YOUTUBE"
echo "-------------------"
echo "CANAL: youtube.com/channel/UCSyG9ph5BJSmPRyzc_eGC4g/"
echo
echo "Verificando último vídeo..."
echo
curl https://www.youtube.com/channel/UCSyG9ph5BJSmPRyzc_eGC4g/ > /home/ricardo/youtube-first/pagina_do_canal
lista=`grep 'ListItem' /home/ricardo/youtube-first/pagina_do_canal`
#echo $lista
echo $lista | cut -c 22-999999 > /home/ricardo/youtube-first/texto.txt
#echo $( cat texto.txt | tr "[:space:]*" "\000" ) | jq '.'

#itemListElement[0].item.itemListElement[0].url
ultimo_video=`cat /home/ricardo/youtube-first/texto.txt | jq '.itemListElement[0].item.itemListElement[0].url'`
echo
echo "ÚLTIMO VÍDEO"
echo $ultimo_video
echo

ultimo_video_comentado=`tail -1 /home/ricardo/youtube-first/videos_comentados.txt`
echo "ÚLTIMO VÍDEO COMENTADO"
echo $ultimo_video_comentado
echo

data=`date`

if [ -z "$ultimo_video" ] #Verifica se a variável tem comprimento zer
then
 echo $data "Sem conexão" >> /home/ricardo/youtube-first/log
 /home/ricardo/youtube-first/espeak-sem-conexao.sh
else

 if test "$ultimo_video" = "$ultimo_video_comentado"
 then
  echo "Já comentado."
  echo $data $ultimo_video "Já comentado" >> /home/ricardo/youtube-first/log
 else
  echo "Novo vídeo, você precisa comentar agora."
  echo $data $ultimo_video "Comentar agora" >> /home/ricardo/youtube-first/log
  echo $ultimo_video >> /home/ricardo/youtube-first/videos_comentados.txt
  echo $data "videos_comentados.txt atualizado com $ultimo_video" >> /home/ricardo/youtube-first/log
  /home/ricardo/youtube-first/espeak-video-novo.sh
 fi

fi

#date >> /home/ricardo/youtube-first/log
#echo $data $ultimo_video >> /home/ricardo/youtube-first/log

