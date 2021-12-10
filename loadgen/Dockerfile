FROM java

#RUN curl -Lo httploadgenerator.jar https://gitlab2.informatik.uni-wuerzburg.de/descartes/httploadgenerator/raw/master/httploadgenerator.jar \
#  && curl -Lo teastore_browse.lua https://raw.githubusercontent.com/DescartesResearch/TeaStore/master/examples/httploadgenerator/teastore_browse.lua \
#  && curl -Lo teastore_buy.lua https://raw.githubusercontent.com/DescartesResearch/TeaStore/master/examples/httploadgenerator/teastore_buy.lua

# COPY ./run_load.sh ./
# COPY ./load_profile.csv ./

COPY . .

ENV WEB_UI teastore-webui
ENV LOAD_PROFILE load_profile.csv
ENV REQUEST_PROFILE teastore_browse.lua
ENV OUTPUT_FILE teastore_output.txt
ENV THREADS 256

CMD ["/bin/bash", "run_load.sh"]
