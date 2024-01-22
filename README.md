# minuify docker action

This action uses [minify](https://www.npmjs.com/package/minify) package to shink the your CSS and HTML files
## Inputs

## `dir`

**Optional** The path where to find your CSS and JS files. Defaults to **WORKSPACE ROOT**

## Example usage
```
- name: Minify 
  uses: kuznetsov17/minify@v1.3
  id: minify-site
  with:
    dir: 'public'
    summary: 'no'
```