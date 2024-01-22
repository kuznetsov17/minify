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

## Summary Example:

# Minify step summary
---

| Filename | Type | Original Size | Minified Size | Saved % | 
|---|---|---|---|---|
|gs_dark.css|CSS|4932|4233|14.1800|
|print.css|CSS|2508|2154|14.1200|
|simple-grid.css|CSS|1691|1671|1.1900|
|gs_light.css|CSS|4491|3932|12.4500|
|main.css|CSS|8797|8338|5.2200|
|print.js|JS|368|276|25.0000|
---