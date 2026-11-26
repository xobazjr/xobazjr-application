#!/usr/bin/env bash
set -euo pipefail

FLUTTER_VERSION="3.41.4"
FLUTTER_DIR="${TMPDIR:-/tmp}/flutter-${FLUTTER_VERSION}"

if ! command -v flutter >/dev/null 2>&1 || ! flutter --version 2>/dev/null | grep -q "Flutter ${FLUTTER_VERSION}"; then
  if [[ "$(uname -s)" != "Linux" || "$(uname -m)" != "x86_64" ]]; then
    echo "Flutter is not installed; this installer supports Vercel's Linux x64 build image." >&2
    exit 1
  fi

  ARCHIVE="${TMPDIR:-/tmp}/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  mkdir -p "${FLUTTER_DIR}"
  curl --fail --location --retry 3 \
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
    --output "${ARCHIVE}"
  tar -xf "${ARCHIVE}" -C "${FLUTTER_DIR}" --strip-components=1
  rm -f "${ARCHIVE}"
  export PATH="${FLUTTER_DIR}/bin:${PATH}"
fi

flutter --version
flutter pub get
flutter build web --release --base-href /
