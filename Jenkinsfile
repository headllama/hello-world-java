git branch: 'main', credentialsId: 'github-w', url: 'https://github.com/headllama/hello-world-java.git'

podTemplate(yaml: readFile('pipeline.yaml')) 
{
  node(POD_LABEL) {
    withCredentials([file(credentialsId: 'maven_settings', variable: 'MVN_SET')]) {
      stage('Maven') {
        container('maven') {
          sh 'echo "******inside maven******"'
          sh 'mvn install -DskipTests -s $MVN_SET'
          sh 'mvn package -DskipTests -s $MVN_SET'
          }
      }

      stage('Unit Test') {
        container('maven') {
          sh 'echo "******inside unit test******"'
          sh 'mvn test -s $MVN_SET'
        }
      }
    
      stage('Sast') {
        container('maven') {
          sh 'echo "******inside sast******"'
          sh 'mvn clean verify sonar:sonar -Dsonar.host.url=http://sonarqube-sonarqube.sonarqube.svc.cluster.local:9000 -Dsonar.login=474724c79825a50038e2566ac65762c7b9694218 -s $MVN_SET'
        }
      }

     stage('Kaniko') {
        container('kaniko') {
          withCredentials([usernamePassword(credentialsId: 'dockerhub-w', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh 'echo "******inside Kaniko******"'
          sh '/kaniko/executor --context `pwd` --destination ${dockerHubUser}/spring-boot-hello:$BUILD_NUMBER'
          }
        }
      }
      stage('Git') {
        withCredentials([gitUsernamePassword(credentialsId: 'github-w', gitToolName: 'git-tool')]) {
        /*  sh '''
          git config --global user.email "walberhugo07@hotmail.com"
          git config --global user.name "walber"
          sed -i "s/1.0/166/g" springboot-kubernetes/spring-deployment.yaml
          cat springboot-kubernetes/spring-deployment.yaml
          git add springboot-kubernetes/spring-deployment.yaml && git commit -m "Build ${BUILD_NUMBER}" && git push origin main
          '''
        }
        
          withKubeConfig([credentialsId: 'presales-java2',
                          namespace: 'presales-java',
                  ]) {
              sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"'  
              sh 'chmod u+x ./kubectl'  
              sh './kubectl apply -f springboot-kubernetes/spring-deployment.yaml'
            } */
          sh 'echo testado'
        }
      }
    }
  }
}
