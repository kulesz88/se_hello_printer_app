.PHONY: test test_api test_ui

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test  --verbose -s

run:
	python main.py

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
			docker run \
				--name hello-world-printer-dev \
		 		 -p 5000:5000 \
		 	 	 -d hello-world-printer

USERNAME=kulesz88
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
				@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
				docker tag hello-world-printer $(TAG); \
				docker push $(TAG); \
				docker logout;

test_smoke:
			curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml

test_api:
	python test_api/check_api.py

test_ui:
	py.test -s --verbose test_ui/test_ui.py
