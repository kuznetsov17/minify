#!/bin/sh
function minify_css (){
    CSS_FILES=$(find . -name *.css|xargs)
    for FILE in ${CSS_FILES}
        do  
            echo Minify CSS ${FILE} >> ${GITHUB_OUTPUT}
            csso -i ${FILE} -o ${FILE}
        done
}
function minify_js (){
    JS_FILES=$(find . -name *.css|xargs)
    for FILE in ${CSS_FILES}
        do
            echo Minify JS ${FILE} >> ${GITHUB_OUTPUT}
            uglifyjs ${FILE} -m -o ${FILE}
        done
}

cd /github/workspace/${1}
    minify_css
    minify_js


