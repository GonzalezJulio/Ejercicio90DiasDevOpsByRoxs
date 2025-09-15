# Usa una imagen base ligera
FROM alpine

# Instala bash y coreutils para usar sleep y date
RUN apk add --no-cache bash coreutils

# Copia un script
COPY writer.sh /writer.sh

# Da permisos de ejecución
RUN chmod +x /writer.sh

# Comando por defecto
CMD ["/writer.sh"]
