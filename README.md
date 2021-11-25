# pandoc-eisvogel-docker

All credits belong to the great pandoc and eisvogel projects.

This container shall ease up, the converting from a tex or md file to a pdf.
With the help of docker.

It works by checking the CMD of the `docker run` command.

If the `entrypoint.sh` finds a "pandoc" in the cmd pandoc gets called otherwise pdflatex is called.

## INSTALL

```bash
docker build -t latex .
```

## USAGE

Create an alias and you're good to go

```bash
alias pandoc="docker run --rm -v $PWD:/app:rw latex pandoc"
alias pdflatex="docker run --rm -v $PWD:/app:rw latex"
```

```bash
pandoc test.md -o test.pdf --from markdown --template eisvogel --listings
```
