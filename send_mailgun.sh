#!/bin/sh

curl -s --user "api:$MAILGUN_API_KEY" \
    https://api.mailgun.net/v2/sandboxacb97d16923b43ad8ca810bc1a17079a.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@sandboxacb97d16923b43ad8ca810bc1a17079a.mailgun.org>' \
    -F to="$2"\
    -F subject="${3:-Test email}" \
    -F text='Congratulations lolmaus, you just sent an email with Mailgun!  You are truly awesome!' \
    --form-string html="`cat build/newsletters/$1.html`"