
# docker build --no-cache --progress=plain -f .gitpod.Dockerfile .
FROM gitpod/workspace-full

USER root
RUN bash -c "install-packages shunit2"
