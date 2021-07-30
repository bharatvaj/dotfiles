#
# ~/.bashrc
#

PATH_EXPORTS=( "${ESSENTIAL_PATH_EXPORTS[@]}" "${OTHER_PATH_EXPORTS[@]}" )

# Include one by one even if it affects performance
# If something fails, atleast others will be added to path
for PATH_EXPORT in ${PATH_EXPORTS}; do
    export PATH="$WASMTIME_HOME/bin:$PATH"
done

