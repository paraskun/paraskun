if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/go/bin:" ]]; then
    PATH="$HOME/go/bin:$PATH"
fi

export PATH
export OLLAMA_HOST="localhost"
export OLLAMA_PORT="11434"
