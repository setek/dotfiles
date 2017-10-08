n stable
n use stable
if test ! $(which spoof)
then
  npm install -g spoof
fi

if test ! $(which avn)
then
  npm install -g avn avn-n
  avn setup
fi

