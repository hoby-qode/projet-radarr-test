FROM linuxserver/radarr:latest

# Copier ton script de vérification de token dans l'image
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Le script devient le point d'entrée
ENTRYPOINT ["/app/entrypoint.sh"]
