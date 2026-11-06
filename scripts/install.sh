#!/usr/bin/env bash
set -euo pipefail
# Usage: bash scripts/install.sh [all|claude|codex|gemini] [destination-root]
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
repo_root="$(cd -- "$script_dir/.." && pwd -P)"
source_dir="$repo_root/skills/dotnet-api-mentor"
tool="${1:-all}"
destination="${2:-$repo_root}"
if command -v cygpath >/dev/null 2>&1; then
  destination="$(cygpath -u -- "$destination")"
fi
case "$tool" in
  all) names=(.claude .agents .gemini) ;;
  claude) names=(.claude) ;;
  codex) names=(.agents) ;;
  gemini) names=(.gemini) ;;
  *) echo 'Usage: install.sh [all|claude|codex|gemini] [destination-root]' >&2; exit 2 ;;
esac
[[ -f "$source_dir/SKILL.md" ]] || { echo 'Source skill missing.' >&2; exit 1; }
[[ -z "$(find "$source_dir" -type l -print -quit)" ]] || { echo 'Source links are not supported.' >&2; exit 1; }
targets=()
for name in "${names[@]}"; do
  target="$destination/$name/skills/dotnet-api-mentor"
  ancestor="$target"
  while [[ "$ancestor" != '.' && "$ancestor" != '/' ]]; do
    if [[ -L "$ancestor" || ( -e "$ancestor" && ! -d "$ancestor" ) ]]; then
      echo "Unsafe destination component: $ancestor" >&2; exit 1
    fi
    next_ancestor="$(dirname -- "$ancestor")"
    # Git Bash may preserve a Windows drive root instead of returning '/'.
    [[ "$next_ancestor" == "$ancestor" ]] && break
    ancestor="$next_ancestor"
  done
  if [[ -d "$target" ]]; then
    [[ -z "$(find "$target" -type l -print -quit)" ]] || { echo "Destination contains links: $target" >&2; exit 1; }
    diff -qr -- "$source_dir" "$target" >/dev/null || { echo "Existing installation differs: $target. No files overwritten; use a fresh destination or reconcile manually." >&2; exit 1; }
    echo "Already current: $target"
  else
    targets+=("$target")
  fi
done
for target in "${targets[@]}"; do
  mkdir -p -- "$target"
  cp -R -- "$source_dir/." "$target/"
  echo "Installed: $target"
done
echo 'Restart/reload the target tool and verify skill discovery. No global settings or trainee state were changed.'
