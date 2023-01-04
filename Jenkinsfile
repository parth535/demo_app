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
                withSonarQubeEnv(credentialsId: 'sonar-id' , installationName: 'sonar-server') {
                sh 'mvn clean pakage sonar:sonar'
}
               
        }
    }
}
}





