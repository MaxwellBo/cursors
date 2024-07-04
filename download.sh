
#!/bin/bash

download_file() {
    local i=$1
    local url="https://ifyoulived.org/cursorsarchive/NN_cursors/c_$i.png"
    if curl -f -O "$url"; then
        echo "Downloaded c_$i.png successfully."
    else
        echo "Failed to download c_$i.png."
    fi
}

export -f download_file  # Export function so that xargs can use it

# Generate sequence and pipe it to xargs, running up to 10 parallel jobs
seq 0 9999 | xargs -I {} -P 10 bash -c 'download_file "$@"' _ {}
