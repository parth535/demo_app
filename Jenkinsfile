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
            nexusArtifactUploader artifacts: [
                [artifactId: 'springboot', 
                classifier: '', 
                file: 'target/my-application.jar', 
                type: 'jar']
                ], 
                credentialsId: 'nexus-id', 
                groupId: 'org.springframework.boot', 
                nexusUrl: 'http://13.233.28.143:8081/', 
                nexusVersion: 'nexus3', protocol: 'http', 
                repository: 'http://13.233.28.143:8081/repository/my-repo/', 
                version: '2.6.6'
            
        }        
    }
}