FROM postgis/postgis:11-3.1-alpine AS dataloader
# Remove daemon initialization from the entrypoint script
RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
# Set auth 
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
# Can't use the default /var/lib/postgresql/data since it's a volume (no persistence)
ENV PGDATA=/data
# Copy our version of PostGIS installation script (only postgis extension itself)
COPY init_postgis.sh /docker-entrypoint-initdb.d/10_postgis.sh
# Copy our dump into a directory of init scripts
COPY roads_mmo.sql stops.sql /docker-entrypoint-initdb.d/
# Initialize PG
RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]
# Copy the loaded data to the new image
FROM postgis/postgis:11-3.1-alpine

COPY --from=dataloader /data $PGDATA