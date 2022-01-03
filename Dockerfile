FROM debian:buster-slim

RUN apt-get update; \
    apt-get install -y texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-lang-german \
                        tex-common \
                        texlive-fonts-extra \
                        locales \
                        pandoc

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt install -y wget
RUN mkdir -p /usr/share/pandoc/data/templates && \
    wget https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex \
        -O /usr/share/pandoc/data/templates/eisvogel.latex

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN mkdir /app
WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
