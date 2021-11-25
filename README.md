# docker latex helper

## INSTALL

```bash
docker build -t latex .
```

## USAGE

```bash
alias pandoc="docker run --rm -v $PWD:/app:rw latex pandoc"
alias pdflatex="docker run --rm -v $PWD:/app:rw latex"
```

```bash
pandoc test.md -o test.pdf --from markdown --template eisvogel --listings
```
