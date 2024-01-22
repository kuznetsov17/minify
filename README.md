# minify docker action

This action uses [uglify-js](https://github.com/mishoo/UglifyJS) to optimize the your JS files.
The [csso-cli](https://github.com/css/csso-cli) is used to minify CSS files.

The script will scan all files under your **dir** and overwrite them with minified versions.

## Inputs

## `dir`

**Optional** The path where to find your CSS and JS files. Defaults to **WORKSPACE ROOT**

## `summary`

**Optional** can be 'yes' or 'no'. Defines if step summary will be displayed in job summary

## Example usage
```
- name: Minify 
  uses: kuznetsov17/minify@v1.3
  id: minify-site
  with:
    dir: 'public'
    summary: 'no'
```