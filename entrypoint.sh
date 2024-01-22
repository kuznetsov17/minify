#!/bin/sh

function summary () {
    if [ "${INPUT_SUMMARY}" = "yes" ]; then
        SUMMARY=$1
        echo "${SUMMARY}" >> $GITHUB_STEP_SUMMARY
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
            echo "|$(basename ${FILE})|JS|${orig_size}|${new_size}|${ratio}|" >> $GITHUB_STEP_SUMMARY
        done
}

cat << 'EOF' > SUM_TOP
# Minify step summary
---

| Filename | Type | Original Size | Minified Size | Saved % | 
|---|---|---|---|---|
EOF
summary "${SUM_TOP}"

cd /github/workspace/${INPUT_DIR}
    minify_css
    minify_js

cat << 'EOF' > SUM_BOTTOM
---
EOF

summary "${SUM_BOTTOM}"