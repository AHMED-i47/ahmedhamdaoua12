# Supprimer les fichiers Tailbliss restants
Remove-Item -Path "static/images/tailbliss-rocket-indigo.webp" -Force
Remove-Item -Path "static/images/tailbliss-cover.png" -Force
Remove-Item -Path "static/images/tailbliss-full-blue.png" -Force
Remove-Item -Path "static/images/site-logo.svg" -Force
Remove-Item -Path "static/images/sample-logo.svg" -Force
# Supprimer le dossier site qui contient les nouvelles images (nous utilisons celles du dossier cybersecurity)
Remove-Item -Path "static/images/site" -Recurse -Force 