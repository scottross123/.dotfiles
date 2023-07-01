#!/bin/sh

ln -s $HOME/.dotfiles/config/code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/.dotfiles/config/code/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

# TODO install only what is needed
EXTENSIONS=(aaron-bond.better-comments barretren.papercolor-vscode Claudius.classic-terminal DavidAnson.vscode-markdownlint dbaeumer.vscode-eslint eamodio.gitlens esbenp.prettier-vscode firsttris.vscode-jest-runner GitHub.copilot github.vscode-github-actions Heron.firefox-devtools-theme ibmlover.oxocarbon JoelCrosby.one-dark-darker marvinengelmann.ibm-theme me-dutour-mathieu.vscode-github-actions mrworkman.papercolor-vscode-redux ms-azuretools.vscode-docker ms-vscode-remote.remote-containers ms-vscode.vscode-typescript-next nrwl.angular-console PaperFanz.ibm-color-palette-color-scheme redhat.java redhat.vscode-yaml Redocly.openapi-vs-code richie5um2.vscode-statusbar-json-path rozbo.papercolor-vscode VisualStudioExptTeam.intellicode-api-usage-examples VisualStudioExptTeam.vscodeintellicode vscjava.vscode-gradle vscjava.vscode-java-debug vscjava.vscode-java-dependency vscjava.vscode-java-pack vscjava.vscode-java-test vscjava.vscode-maven vscode-icons-team.vscode-icons vscodevim.vim wuqiong.theme-vintage-paper yoavbls.pretty-ts-errors yzhang.markdown-all-in-one zhuangtongfa.material-theme)

for extension in "${EXTENSIONS[@]}"; do
    echo $extension
    code --install-extension $extension 
done

# also had code to path
