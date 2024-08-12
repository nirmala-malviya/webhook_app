# Webhook App


## Getting Started

Follow these steps to set up the project locally:

- Clone from the repository 

	git clone https://github.com/nirmala-malviya/webhook_app.git

- Go to inside the project directory run below comman.

	bundle install

- For Database setup

	rails db:create
	rails db:migrate
    rails db:seed

- Run server locally

	rails s

- For sidekiq, Install and Start Redis

	sudo apt-get install redis-server
    sudo service redis start

- Run sidekiq

    bundle exec sidekiq


Make sure you change the value of the url field with any exsiting get url in seed file. 


## Future Enhancement

- I have used the call_type and secret field in Webhook Model. Which can be used further to make third party call dynamic. As per now I have used get type statically and didn't used secret for now.

- But we can use secret to generate the signature. Which can be used further for authentication. As many webhook receivers expect some form of signature.