# Settings
c.tabs.background = True
c.tabs.padding = {"top": 5, "bottom": 5, "left": 5, "right": 5}
c.auto_save.session = True
c.fonts.monospace = "Source Code Pro"
c.input.insert_mode.auto_load = True
c.editor.command = ["xfce4-terminal", "--disable-server", "--role=scratchvim", "--execute", "vim", "{file}"]
c.url.searchengines = {
    "DEFAULT"   : "https://duckduckgo.com/?q={}",
    "yt"        : "https://www.youtube.com/results?search_query={}",
    "man"       : "http://www.google.com/search?q={}&sitesearch=man7.org/linux/man-pages",
    "w"         : "https://en.wikipedia.org/wiki/Special:Search?search={}",
}
c.downloads.location.directory = '/home/catalina/downloads'
c.downloads.remove_finished = 60000

# Aliases
c.aliases['pocket'] = "open -t https://getpocket.com/edit?url={url}"
#c.aliases['sanitize'] = "spawn /home/pbui/.config/qutebrowser/scripts/clear_cookies.py {url:host} ;; restart"

# Bindings
config.bind('O', 'set-cmd-text :open {url:pretty}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('T', 'set-cmd-text :open -t -r {url:pretty}')
config.bind('<', 'tab-prev')
config.bind('>', 'tab-next')

# Themes
config.source('themes/nord.py')
