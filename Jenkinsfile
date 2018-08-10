stage 'Checkout'
 node('master') {
  deleteDir()
  checkout scm
  stage('Multicanalidade'){
  try{
    sh "bundle install && parallel_cucumber features\* -n 10 -o 'remote=true -p html_report'"
  } catch (err) {

  } finally {
    publishHTML (target: [
    reportDir: '\reports\json',
    reportFiles: 'features_report.html',
    reportName: "Smoke tests report"
    ])
  }
 }
}
