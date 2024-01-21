#!/bin/sh
function minify_css (){
    CSS_FILES=$(find . -name *.css|xargs)
    for FILE in ${CSS_FILES}
        do  
            orig_size=$(wc -c ${FILE}|awk {'print $1'})
            csso -i ${FILE} -o ${FILE}
            new_size=$(wc -c ${FILE}|awk {'print $1'})
            echo "|$(basename ${FILE})|CSS|${orig_size}|${new_size}|" >> $GITHUB_STEP_SUMMARY
        done
}
function minify_js (){
    JS_FILES=$(find . -name *.js|xargs)
    for FILE in ${JS_FILES}
        do  
            orig_size=$(wc -c ${FILE}|awk {'print $1'})
            uglifyjs ${FILE} -m -o ${FILE}
            new_size=$(wc -c ${FILE}|awk {'print $1'})
            echo "|$(basename ${FILE})|JS|${orig_size}|${new_size}|" >> $GITHUB_STEP_SUMMARY
        done
}

cat << 'EOF' >> $GITHUB_STEP_SUMMARY
| Filename | Type| Original Size | Minified |
|---|---|---|---|
EOF

cd /github/workspace/${INPUT_DIR}
    minify_css
    minify_js


