if test -n "$(git -C ${DOTFILES_DIR} status --porcelain)" ||
   ! git -C ${DOTFILES_DIR} diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[36m=== DOTFILES IS DIRTY ===\e[m"
  echo -e "\e[33mThe dotfiles have been changed.\e[m"
  echo -e "\e[33mPlease update.\e[m"
  echo -e "\e[36m=========================\e[m"
fi
