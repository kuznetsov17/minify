# minuify docker action

This action uses [minify](https://www.npmjs.com/package/minify) package to shink the your CSS and HTML files
## Inputs

## `css`

**Optional** The path where to find your CSS files. Defaults to **WORKSPACE ROOT**

## `js`

**Optional** The path where to find your JS files. Defaults to **WORKSPACE ROOT**

## Example usage

uses: actions/hello-world-docker-action@v2
with:
  who-to-greet: 'Mona the Octocat'