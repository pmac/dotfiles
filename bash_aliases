alias vi=vim
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -lA'
alias lt='ls -ltrA'
alias tl='twidge update'
alias lstl='twidge lsarchive'
alias psg='ps aux | grep -i'
alias pp='pbpaste | curl -s -F "sprunge=<-" sprunge.us | pbcopy'
alias ppo='pp && pbpaste | xargs open'

if [ -x /usr/bin/htop ]; then
    alias top='htop'
fi

alias rmpyc='find . -name "*.pyc" -delete'
alias rmlesscss='find . -name "*.less.css" -delete'
alias testsyncdb='python manage.py syncdb --settings=settings_local_test'
alias testmigrate='python manage.py migrate --settings=settings_local_test'
#alias djsetuptest='django-test-setup.py -cm && testsyncdb && testmigrate'
alias djtest='python manage.py test'
alias pt='py.test'
alias djrunserver='python manage.py runserver'
alias djcoverage='djtest --with-coverage && coverage html'
alias djshell='python manage.py shell_plus'
alias startredis='redis-server /usr/local/etc/redis.conf'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias deis-euw='DEIS_PROFILE=euw deis'
alias tagdate='date --rfc-3339=date'

cl(){
    cd $1 && ll
}

alias gtd='git-date-tag'
alias gcom='gco master'
alias gcb='gco -b'
alias gsu='git su'
alias gci='git ci'
alias gst='git st'
alias gbg='git branch | grep -i'
alias grbm='git rebase master'
alias grbim='git rebase -i master'
alias git-delete-merged='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gcmgl='gco master && git pull --ff-only'
alias gpf='git push -f'
alias gppf='gpf pmclanahan'
alias gppr='git push pmclanahan && hub pr'
alias gppmacio='git push pmacio -f $(git here):master'
alias rmgituntracked='gst --porcelain | grep "^??" | cut -d " " -f2 | xargs rm -rf'
alias gclean='git clean -fdx .'
alias gdryclean='git clean -ndx .'
alias hco='hub co'
alias hpr='hub pr'
alias ghpr='gppf && hpr'
alias z='workon'
alias django-lint="python /Users/pmclanahan/src/django-compat-lint/django_compat_lint.py --django-16"

alias randompasswd='dd if=/dev/urandom bs=1 count=48 | base64 | pbcopy'
alias dokku='$HOME/src/dokku/contrib/dokku_client.sh'

whothefuckisusingport() {
  lsof -i tcp:$*
}

git-date-tag() {
  date_tag=$(date --rfc-3339=date)
  tag_suffix=0
  tag_value=$date_tag
  git tag $date_tag 2> /dev/null
  while [[ $? != 0 ]]; do
    tag_suffix=$(( $tag_suffix + 1 ))
    tag_value="${date_tag}.${tag_suffix}"
    git tag $tag_value 2> /dev/null
  done
  echo "tagged $tag_value"
}

nse() { docker exec -it $1 bash; }
