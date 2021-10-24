# Contact Importer

Demo site: http://contact-importer-production.herokuapp.com/


## Description

The application allow users to upload contact files in CSV format and process them in order
to generate a unified contact file. The contacts gonna be associated with the user who imported
them into the platform. When uploading the files, the application must validate that the fields
entered are correctly formatted.

### Setup

Requirements:
- Ruby 2.7.2
- Rails 6+
- Postgresql
- Yarn

Clone:
``` sh
git clone git@github.com:OscarMichelH/contact-importer.git
```

Open project and execute:
``` sh
cd contact-importer
yarn install
bundle install
```

Setup `application.yml` secrets with 
``` sh
bundle exec figaro install
```
on `application.yml` use
``` sh
DB_USERNAME: postgres
DB_PASSWORD: root
SEND_IN_BLUE_API_KEY: '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'
SEND_IN_BLUE_PASSWORD: '5bkRLz9DMsSA0TIC'
SEND_IN_BLUE_USERNAME: 'oscarmichelh@gmail.com'
```


Setup database tables:
``` sh
rails db:setup
```
Run app:
``` sh
rails s
```


## Usage

Open at localhost:3000 and register with valid email.
Email confirmation will send to your email, if not found on
main inbox, search in spam folder.

Login with your validate mail and start use the page from home page logged, and loading a CSV file (example in repo: example.csv) and match the headers with information, then select again the file and submit to process, a summary will appear at final with contacts created and details of the contacts not imported.
