BACK_CONTAINER = library_back
FRONT_CONTAINER = library_front

TEST_BACK_ENTRY = bash test.sh
LINT_BACK_ENTRY = black . --check -v

TEST_FRONT_ENTRY = npm run test
LINT_FRONT_ENTRY = npm run lint

up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose build

test-back:
	docker-compose run --rm --entrypoint "${TEST_BACK_ENTRY}" ${BACK_CONTAINER}

test-front:
	docker-compose run --rm --no-deps -e CI=true --entrypoint "${TEST_FRONT_ENTRY}" ${FRONT_CONTAINER}

lint-front:
	docker-compose run --rm --no-deps --entrypoint "${LINT_FRONT_ENTRY}" ${FRONT_CONTAINER}

lint-back:
	docker-compose run --rm --entrypoint "${LINT_BACK_ENTRY}" ${BACK_CONTAINER}
