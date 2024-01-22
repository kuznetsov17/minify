#!/bin/sh

function summary () {
    if [ "${INPUT_SUMMARY}" = "yes" ]; then
        echo "${1}" >> $GITHUB_STEP_SUMMARY
    fi
}

function minify_css (){
    CSS_FILES=$(find . -name *.css|xargs)
    for FILE in ${CSS_FILES}
        do  
            orig_size=$(wc -c ${FILE}|awk {'print $1'})
            csso -i ${FILE} -o ${FILE}
            new_size=$(wc -c ${FILE}|awk {'print $1'})
            ratio=$(bc -e "scale=4;100*(1-${new_size}/${orig_size}")
            summary "|$(basename ${FILE})|CSS|${orig_size}|${new_size}|${ratio}|"
        done
}
function minify_js (){
    JS_FILES=$(find . -name *.js|xargs)
    for FILE in ${JS_FILES}
        do  
            orig_size=$(wc -c ${FILE}|awk {'print $1'})
            uglifyjs ${FILE} -m -o ${FILE}
            new_size=$(wc -c ${FILE}|awk {'print $1'})
            ratio=$(bc -e "scale=4;100*(1-${new_size}/${orig_size}")
            summary "|$(basename ${FILE})|JS|${orig_size}|${new_size}|${ratio}|"
        done
}

read -r -d '' SUM_TOP <<- EOF
# Minify step summary
---

| Filename | Type | Original Size | Minified Size | Saved % | 
|---|---|---|---|---|
EOF
summary "${SUM_TOP}"

cd /github/workspace/${INPUT_DIR}
    minify_css
    minify_js

read -r -d '' SUM_BOTTOM <<- EOF
---
EOF

summary "${SUM_BOTTOM}"