
To install all dependencies:

	$ bundle install

### send-mail

Send email from your gmail account.
__Subject__ should be passed as first parameter.
__Body__ should be passed as second parameter or through standard input.

Make sure, these environment variables are set before using this script.

	export AUTOMATION_EMAIL="your email"
	export AUTOMATION_PASSWORD="password"
	export AUTOMATION_TO="receiver's email"

####Usage

	$ ruby send-mail.rb 'Subject' 'Hello World'

	$ echo "Hello World" | ruby send-mail.rb 'Subject'

	$ ruby send-mail.rb 'Subject'
	1
	2
	Ctrl-D

