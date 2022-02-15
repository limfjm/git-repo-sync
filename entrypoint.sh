git remote add target https://${INPUT_TARGET_USERNAME}:${INPUT_TARGET_TOKEN}@${INPUT_TARGET_URL#https://}

echo git remote

case "${GITHUB_EVENT_NAME}" in
    push)
        git push -f --all target
        git push -f --tags target
        echo push event
        ;;
    delete)
        git push -d target ${GITHUB_EVENT_REF}
        echo push delete
        ;;
    *)
        break
        ;;
esac
