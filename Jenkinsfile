pipeline{
    agent any
    stages{
        stage("git checkout code"){

            steps{

                    git branch: 'main', url: 'https://github.com/parth535/demo_app.git'
            }
        }
        stage("for testing"){
            steps{

                sh 'mvn test'
            }


        }
    }
}