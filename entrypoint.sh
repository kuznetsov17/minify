#!/bin/sh
function minify_css (){
    CSS_FILES=$(find . -name *.css|xargs)
    for FILE in ${CSS_FILES}
        do  
            echo "Minify CSS **${FILE}**" >> $GITHUB_STEP_SUMMARY
            csso -i ${FILE} -o ${FILE}
        done
}
function minify_js (){
    JS_FILES=$(find . -name *.js|xargs)
    for FILE in ${JS_FILES}
        do
            echo "Minify JS **${FILE}**" >> $GITHUB_STEP_SUMMARY
            uglifyjs ${FILE} -m -o ${FILE}
        done
}

cd /github/workspace/${1}
    minify_css
    minify_js


