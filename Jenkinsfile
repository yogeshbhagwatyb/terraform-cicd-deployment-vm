// pipeline {
//     agent any

//     environment {
//         AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
//         AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
//     }

//     stages {
//         stage('Clone Repository') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/yogeshbhagwatyb/terraform-cicd-deployment-vm.git'
//             }
//         }

//         stage('Terraform Init') {
//             steps {
//                 sh 'terraform init'
//             }
//         }

//         stage('Terraform Plan') {
//             steps {
//                 sh 'terraform plan'
//             }
//         }

//         stage('Terraform Apply') {
//             steps {
//                 sh 'terraform apply -auto-approve'
//             }
//         }
//         stage('Terraform Apply or Destroy') {
//             steps {
//                 script {
//                     if (params.DESTROY_INFRA) {
//                         sh 'terraform destroy -auto-approve -var-file=terraform.tfvars'
//                     } else {
//                         sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
//                     }
//                 }
//             }
//         }
        
//     }
// }
pipeline {
    agent any

    parameters {
        booleanParam(name: 'DESTROY_INFRA', defaultValue: false, description: 'Destroy infrastructure instead of apply')
        choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: 'Select environment')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_ENV                = "${params.ENV}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/yogeshbhagwatyb/terraform-cicd-deployment-vm.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init -reconfigure -backend-config="key=env/${TF_ENV}/terraform.tfstate"
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var="environment=${TF_ENV}"'
            }
        }

        stage('Terraform Apply or Destroy') {
            steps {
                script {
                    if (params.DESTROY_INFRA) {
                        sh 'terraform destroy -auto-approve -var="environment=${TF_ENV}"'
                    } else {
                        sh 'terraform apply -auto-approve -var="environment=${TF_ENV}"'
                    }
                }
            }
        }
    }

}
