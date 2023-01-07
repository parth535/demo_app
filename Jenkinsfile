pipeline{
    agent any
    stages{
        stage("git checkout code"){

            steps{

                    git branch: 'main', url: 'https://github.com/parth535/demo_app.git'
            }
        }
        stage("building package"){
            steps{

                sh 'mvn clean package -Dmaven.test.skip'
            }

        }

        stage("static code analysis"){
            steps{

                withSonarQubeEnv(credentialsId: 'sonar-token', installationName: 'sonar-server') {
                    sh 'mvn sonar:sonar'
              }
            }
        }
        stage("build docker image "){
            
        }
    }
}