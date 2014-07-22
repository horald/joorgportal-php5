git add --all
let uebergabe=$1
if [ "$uebergabe" != "" ]; then
  git commit -m "$uebergabe"
else
  git commit -m "Undocumented Changes"
fi
git push
