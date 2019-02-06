# circleci-eks-agent

Agent for CircleCI to interface with AWS EKS.
This is a container image for a CircleCI agent
that needs to execute against AWS EKS.

## Assumptions
* You have `DOCKER_HUB_USER` and `DOCKER_HUB_USER` defined
  as CircleCI environment variables.
* You have fixed `.circleci/config.yml` with the correct
  parameters.
