FROM base/archlinux:2018.08.01

RUN pacman -Syv --noconfirm \
  git neovim
ARG VIMUSER=yavin
RUN useradd -mc '' ${VIMUSER}
RUN mkdir /home/${VIMUSER}/.vim
WORKDIR /home/${VIMUSER}/.vim

RUN git clone --recurse-submodules --depth 1 https://github.com/whatbirdisthat/vim-yavin.git /home/${VIMUSER}/.config/nvim
RUN chown -R ${VIMUSER} /home/${VIMUSER}

USER ${VIMUSER}

RUN ln -s /home/${VIMUSER}/.config/nvim/bundle/yavin/vimrc /home/${VIMUSER}/.config/nvim/init.vim

ENTRYPOINT [ "nvim" ]

