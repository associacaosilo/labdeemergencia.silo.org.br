FROM jekyll/jekyll

RUN mkdir -p /opt/build
WORKDIR /opt/build
ADD build.sh /opt/build

CMD ["./build.sh"]
