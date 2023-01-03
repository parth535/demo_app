pipeline{

    agent any

    stages{

        stage("static code analysis"){
            agent{
                docker{
                    image 'maven'
                }
            }

            steps{
                withSonarQubeEnv(credentialsId: 'sonar-token', installationName: 'sonar-server') {
                      sh 'mvn clean package sonar:sonar'


            }
        }
    }
}