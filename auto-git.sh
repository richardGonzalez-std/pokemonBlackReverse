#!/usr/bin/env bash
set -x
branch=$(git rev-parse --abbrev-ref HEAD)

echo "[auto-git] Staging all changes…"
git add -A

if git diff --cached --quiet; then
  echo "[auto-git] No changes to commit."
  echo "[auto-git] Done."
  exit 0
fi

msg="Auto‑commit: $(date +'%Y-%m-%d %H:%M:%S') – saved changes"
echo "[auto-git] Committing: $msg"
git commit -m "$msg"

echo "[auto-git] Pushing to origin/$branch…"
# force SSH to use your key directly and never prompt
echo '$HOME/.ssh/id_ed25519'
GIT_SSH_COMMAND='ssh -i $HOME/.ssh/id_ed25519 -o IdentitiesOnly=yes' \
  git push --verbose origin "$branch" \
    && echo "[auto-git] Push complete." \
    || echo "[auto-git] Push failed."

echo "[auto-git] Done."
