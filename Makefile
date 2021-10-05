BlueimageRepo = mahmoudelerian/blueversion
GreenimageRepo = mahmoudelerian/greenversion
VERSION = latest
setup:
	# setting up the virtual environment
	python3 -m venv ~/.devops

install:
	# installing
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	# lint of the both docker files
	hadolint Docker_blue
	hadolint Docker_green
buildingtheblue:
    # build and push the blue version
	docker build -f Docker_blue -t $(BlueimageRepo) .
	docker tag $(BlueimageRepo) $(BlueimageRepo):$(VERSION)
	docker push $(BlueimageRepo)
buildingthegreen: 
    # build and push the green version
	docker build -f Docker_green -t $(GreenimageRepo) .
	docker tag $(GreenimageRepo) $(BlueimageRepo):$(VERSION)
	docker push $(GreenimageRepo)
all: install lint
