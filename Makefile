validate: template.yaml
	aws cloudformation validate-template \
		--template-body file://template.yaml

vendor: Gemfile
	bundle install --path vendor/bundle

function.zip: lambda.rb vendor
	zip function.zip lambda.rb
	zip -r function.zip vendor

create: function.zip
	aws lambda create-function \
		--function-name hidden-alphabet-api \
		--handler lambda.handle \
		--runtime ruby2.5 \
		--role arn:aws:iam::465245944185:role/aws-lambda-hidden-alphabet-api \
		--zip-file fileb://function.zip

	rm function.zip

update: function.zip
	aws lambda update-function-code \
		--function-name hidden-alphabet-api \
		--zip-file fileb://function.zip

	rm function.zip
