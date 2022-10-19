# SmartHome
# TL;DR
A tutorial how to build smart home from scrach
## Decisions log

use the github [markdown emoji markup](https://gist.github.com/rxaviers/7360908) to show type for decision

| Emoji    | Short description      |
| -------- | ---------------------- |
| :cloud:  | Deployment             |
| :gift:   | Development            |
| :hammer: | Architecture decisions |

| Decision                            | Description                                                                                                                                                                                                                                   | Timeframe                                                         |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| :cloud: vendor locked-in            | The solution is locked-in in the AWS Cloud - we don't want to build Multi Cloud solution.                                                                                                                                                     | 21.03.2021 [PR1](https://github.com/mjendza/aws-sandbox/pull/1)   |
| :hammer: Typescript                 | Typescript is awesome :heart: language for microservices (Typesafe and for small size of the repositories is maintainable). Very fast for prototyping and delivering simple solution.                                                         | 21.03.2021 [PR1](https://github.com/mjendza/aws-sandbox/pull/1)   |
| :cloud: CDK                         | We can define deployment with the Typescript language and forget about YAML or JSON.                                                                                                                                                          | 21.03.2021 [PR1](https://github.com/mjendza/aws-sandbox/pull/1)   |
| :cloud: github actions              | I want to try github actions as build server to CI. For now we don't want to publish stack to AWS.                                                                                                                                            | 23.03.2021 [PR3](https://github.com/mjendza/aws-sandbox/pull/3)   |
| :gift: eslint                       | Code can be verify for standard issues connected with JavaScript based on static analyze from eslint.                                                                                                                                         | 23.03.2021 [PR4](https://github.com/mjendza/aws-sandbox/pull/4)   |
| :gift: prettier                     | We can keep same formatting.                                                                                                                                                                                                                  | 23.03.2021 [PR4](https://github.com/mjendza/aws-sandbox/pull/4)   |
| :hammer: ajv                        | We want to validate json schema (and **only schema** for AWS Lambada incoming event) ajv is very simple validation library                                                                                                                    | 23.03.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :man: manual testing                | We want to use humao.rest-client and VS code to make the HTTP requests the API GW                                                                                                                                                             | 31.03.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :gift: webpack                      | We want to publish lambda Typescript code as JavaScript with webpack                                                                                                                                                                          | 31.03.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :gift: ts-loader                    | To load dependencies we want to use ts-loaded based on [examples](https://github.com/TypeStrong/ts-loader/tree/main/examples)                                                                                                                 | 31.03.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :cloud: X-RAY                       | We want to see the trace for each action in the system. The best option is to use AWS X-RAY.                                                                                                                                                  | 21.03.2021 [PR1](https://github.com/mjendza/aws-sandbox/pull/1)   |
| :hammer: node-lambda-log            | We want to try a library for [logging](https://github.com/KyleRoss/node-lambda-log), not sure if this is a best library. Will see...                                                                                                          | 03.04.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :hammer: kebab case                 | We want to use kebab case for files and folders convention.                                                                                                                                                                                   | 03.04.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :hammer: pascal case                | For Typescript class names.                                                                                                                                                                                                                   | 03.04.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :hammer: testing                    | We want to use `jest` library. Based on the friends recommendation this is the best and awesome test library on the javascript market                                                                                                         | 03.04.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :cloud: DynamoDB                    | The context for demo service is users. To minimize latency to 80% cases (read by key) the best fit is use DynamoDB storage. We want to replicate data to all needed regions, so the DynamoDB connection helper calls always local DB instance | 07.04.2021 [PR7](https://github.com/mjendza/aws-sandbox/pull/7)   |
| :books: cfn-diagram as doc for CDK  | We want to document AWS Stack with diagram based on the CDK                                                                                                                                                                                   | 31.03.2021 [PR9](https://github.com/mjendza/aws-sandbox/pull/9)   |
| :hammer: database validation        | We decided to use `DynamoDB` so we don't have any control about stored data (required are key and indexed fields). We want to be sure that data returned by the endpoint are valid, so we put the same ajv validation to the entities.        | 08.04.2021 [PR14](https://github.com/mjendza/aws-sandbox/pull/14) |
| :hammer: lambda architecture        | We decided to focus on the lambda implementation as proxy integration with API Gateway. All helpers and custom error with error (exception high level handler) are focused to deliver data as Lambda Proxy Integration.                       | 13.04.2021 [PR14](https://github.com/mjendza/aws-sandbox/pull/14) |
| :cloud: CDK resource names and id's | CDK resources should have id generated by `generateResourceName` helper and autogenerated name. Use `CdkResources` interface to define all needed AWS objects.                                                                                | 14.04.2021 [PR14](https://github.com/mjendza/aws-sandbox/pull/14) |
| :hammer: delivering features        | Push to develop branch is forbidden. Use PR with squash commits to keep clean main branch                                                                                                                                                     | 16.04.2021 [PR1](https://github.com/mjendza/aws-sandbox/pull/1)   |
| :cloud: Event-Driven Architecture   | I really don't like coupling! To build lousily coupled architecture in the cloud we can use EventBridge. Check dedicated [Event-Driven-Architecture paragraf](#Event-Driven-Architecture).                                                    | 04.05.2021 [PR22](https://github.com/mjendza/aws-sandbox/pull/22) |
| :hammer: lambda architecture        | We decided to remove N-Layer architecure - code should be simple.                                                                                                                                                                             | 25.06.2022 [PR14](https://github.com/mjendza/aws-sandbox/pull/XX) |


# Hardware

# Software
## Docker
### run
to run solution use 
```cmd
docker-compose up
```
OR run docker-run.ps1
https://github.com/blaineventurine/home-automation-docker

### dev install
#### list of composes

##### prerequisits
```
docker network create shared-smart-network
```

##### iot full
```cmd 
docker-compose -f home-assistant/docker-compose.yaml -f home-assistant/docker-compose.dev.override.yaml --env-file .env.dev up -d
docker-compose -f observability/docker-compose.yaml --env-file observability/.env.dev up -d
docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d
```

##### home-assistant
use docker-compose `docker-compose.yaml` with `DEV` override
```cmd 
docker-compose -f docker-compose.yaml -f docker-compose.dev.override.yaml --env-file .env.dev up -d
```

##### management
```cmd 
docker-compose -f management/docker-compose.yaml --env-file .env.dev up -d
```


##### observability
```cmd 
docker-compose -f observability/docker-compose.yaml --env-file .env.dev up -d
```

##### queue
```cmd 
docker-compose -f queue/docker-compose.yaml --env-file .env.dev up -d
```

##### remote-access
```cmd 
docker-compose -f remote-access/docker-compose.yaml --env-file .env.dev up -d
```
```cmd force recreate
docker-compose -f remote-access/docker-compose.yaml --env-file .env.dev up -d --force-recreate
```