#!/bin/bash

set -e

VERSION=${CI_BUILD_TAG:-"${CI_BUILD_REF_NAME}"}

env

OPTS="-Dsonar.projectKey=${CI_PROJECT_ID} -Dsonar.projectName=${CI_PROJECT_NAME} -Dsonar.sources=/workspace -Dsonar.projectVersion=${VERSION} -Dsonar.gitlab.project_id=${CI_PROJECT_ID} -Dsonar.gitlab.commit_sha=${CI_BUILD_REF} -Dsonar.gitlab.ref_name=${CI_BUILD_REF_NAME} -Dsonar.issuesReport.console.enable=true -Dsonar.verbose=true"

# TODO: Improve entrypoint to support gitlab-runner
cd ${CI_PROJECT_DIR}
if [[ ! -z $SONAR_TOKEN ]]; then
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.host.url=${SONAR_HOST} -Dsonar.login=${SONAR_TOKEN} ${OPTS}
else
  ${SONAR_SCANNER_HOME}/bin/sonar-scanner ${OPTS}
fi
