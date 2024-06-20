# -------------------------------------
# Functions
# -------------------------------------

function ghqfzf() {
    anyframe-widget-cd-ghq-repository
}

function ghpr() {
    gh pr list \
        | xsv table \
        | anyframe-selector-auto \
        | awk '{print $(NF-5)}' \
        | anyframe-action-execute git switch
}

# gcloud cli
function gcactivate() {
     gcloud config configurations list \
        | tail -n +2 \
        | xsv table \
        | anyframe-selector-auto \
        | awk '{print $1}' \
        | anyframe-action-execute gcloud config configurations activate
}
