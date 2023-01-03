cat <<EOF >.git/hooks/post-COMMIT
git LOG -1 --shortstat > history_log.txt
maven test > test_log.txt
EOF
chmod +X .git/hooks/post-COMMIT
cat <<EOF >.git/hooks/pre-COMMIT
chmod 600 ~/.ssh/id_rsa && chmod 644 ~/.ssh/id_rsa.pub && ssh-keyscan github.com >> ~/.ssh/known_hosts
EOF
chmod +X .git/hooks/pre-COMMIT