if [[ ! -o interactive ]]; then
    return
fi

compctl -K _cst cst

_cst() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(cst commands)"
  else
    completions="$(cst completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
