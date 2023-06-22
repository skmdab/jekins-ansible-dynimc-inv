pipeline{
    
    agent{
        label 'slave'
    }
    
    environment{
        AWS_PRIVATE_KEY=credentials('ec2-key')
    }
    
    stages{
        stage('Checkout the code'){
            steps{
                git 'https://github.com/skmdab/jekins-ansible-dynimc-inv.git'
            }
        
        }

        stage('Create ec2 instance'){
            steps{
                sh "terraform -chdir=terraformscripts init"
                sh "terraform -chdir=terraformscripts apply --auto-approve"
            }
        }
        
        stage('Run the playbook'){
            steps{
                sh "ansible-inventory -i inventory/aws-ec2.yaml --graph"
                sh "ansible-playbook -i inventory/aws-ec2.yaml playbooks/installTomcat.yml -u ec2-user --private-key=$AWS_PRIVATE_KEY --limit tomcat-server --ssh-common-args='-o StrictHostKeyChecking=no'"
            }
        }
    }
}
