pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage ("Checkout") {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Chiranjeevi-Dudi36/project-task']])
            }
        }
        
        stage ("init") {
            steps {
                sh ("terraform init -reconfigure")
            }
        }
        
        stage ("plan") {
            steps {
                sh ("terraform plan")
            }
        }
        
        stage ("action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ("terraform ${action} --auto-approve")
            }
        }
    }
}
