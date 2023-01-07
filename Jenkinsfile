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
        stage("deploy in to nexus"){
            steps{
                   sh 'mvn deploy'
                  }
            
        }  
        stage("build image"){
            steps{
                sh '''
                 docker build -t my-app:v1.${BUID_ID} .
                  docker run -d --name my-container my-app:v1.${BUID_ID}
                '''
            }
        }   
    }
}
