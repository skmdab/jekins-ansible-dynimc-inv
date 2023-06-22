pipeline{
    
    agent{
        label 'slave'
    }
    
    environment{
        github_key=credentials('ansible-creds')
    }
    
    stages{
        stage('Checkout the code'){
            steps{
                git branch: 'testing', url: 'https://github.com/skmdab/jekins-ansible-dynimc-inv.git'
            }
        }
        
        stage('Create tomcat server'){
            steps{
                sh "terraform -chdir=terraformscripts init"
                sh "terraform -chdir=terraformscripts apply --auto-approve"
            }
        }

        stage('waiting for create server'){
            steps{
                sh "sleep time: 40, unit: 'SECONDS'"
            }
        }
        
        stage('Install tomcat'){
            steps{
                sh "ansible-inventory --graph -i inventory/aws_ec2.yaml"
                sh "ansible-playbook -i inventory/aws_ec2.yaml playbooks/installTomcat.yml -u ansible --private-key=$github_key --ssh-common-args='-o StrictHostKeyChecking=no' --limit tomcat_instance"
            }
        }
