# hadolint ignore=DL3007
FROM archlinux/base:latest

RUN pacman -Syv --noconfirm \
  git neovim

ARG VIMUSER=yavin
RUN useradd -mc '' ${VIMUSER}
RUN mkdir -p /home/${VIMUSER}/.config/nvim
WORKDIR /home/${VIMUSER}/.config/nvim

RUN git clone --recurse-submodules --depth 1 https://github.com/whatbirdisthat/vim-yavin.git /home/${VIMUSER}/.config/nvim
RUN chown -R ${VIMUSER} /home/${VIMUSER}

USER ${VIMUSER}

RUN ln -s /home/${VIMUSER}/.config/nvim/bundle/yavin/vimrc /home/${VIMUSER}/.config/nvim/init.vim

ENTRYPOINT [ "nvim" ]
