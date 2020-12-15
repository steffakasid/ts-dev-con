FROM node:fermium-alpine3.12

ARG USERNAME="vscode"
    
# Create User
RUN addgroup --gid 1000 $USERNAME && \
    adduser -s /bin/zsh -u 1000 -D -G $USERNAME $USERNAME

# Install some additional packages
RUN apk update && \
    apk add --no-cache zsh=~5.8-r1 zsh-vcs=~5.8-r1 git=~2.26.2-r0 curl=~7.69.1-r3

# Install oh-my-zsh
RUN curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output install.sh && \
    sh ./install.sh && \
    cp -r /root/.oh-my-zsh /home/vscode/.oh-my-zsh && \
    chown -R $USERNAME:$USERNAME /home/vscode/.oh-my-zsh && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/vscode/.oh-my-zsh/custom/themes/powerlevel10k
