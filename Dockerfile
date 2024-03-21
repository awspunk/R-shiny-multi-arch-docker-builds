ARG BASE_IMAGE=rocker/shiny:4.3.3
FROM ${BASE_IMAGE}
# create app user
RUN addgroup --system app \
    && adduser --system --ingroup app app
## copy app files to container
WORKDIR /home/app
COPY app.R .
# change folder permissions for app directory
RUN chown app:app -R /home/app
# switch container user to app user
USER app
EXPOSE 3838
CMD ["R", "-e", "shiny::runApp('/home/app', port = 3838, host = '0.0.0.0')"]
