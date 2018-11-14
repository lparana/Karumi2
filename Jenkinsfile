//node('macminisergiy') {
pipeline{
    
    agent{
        label 'macminisergiy'
    }
    stages {
        stage('Preparation') {
            echo 'Preparation...'
            sh 'gem install xcpretty'
            sh 'gem install slather'
            // Checkout files.
            checkout([
                $class: 'GitSCM',
                branches: [[name: '*/master']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [], submoduleCfg: [],
                userRemoteConfigs: [[
                    name: 'github',
                    url: 'https://github.com/lparana/Karumi2.git'
                ]]
            ])

            //importDeveloperProfile keychainName: '', keychainPath: '', keychainPwd: '', profileId: '017eb015-01d8-4fd5-8ba2-7cb6536ca56a'

            

            //sh 'xcodebuild -project KataLogInLogOutSwift.xcodeproj -scheme KataLogInLogOutSwift -destination "platform=iOS Simulator,name=iPhone 8"  -enableCodeCoverage YES test'
            //sh 'xcodebuild -scheme "TimeTable" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 6,OS=10.1" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'

            
        }
        stage('Build') {
            echo 'Build...'
            // Build
            sh 'xcodebuild -project KataLogInLogOutSwift.xcodeproj CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | /usr/local/bin/xcpretty -r junit'
        }
        stage('Test') {
        	sh 'xcodebuild -project KataLogInLogOutSwift.xcodeproj -scheme KataLogInLogOutSwift -destination "platform=iOS Simulator,name=iPhone 8"  -enableCodeCoverage YES test | /usr/local/bin/xcpretty'
            // Publish test restults.
            step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
        }

        stage('Analytics') {
            
            parallel Coverage: {
                // Generate Code Coverage report
                sh '/usr/local/bin/slather coverage --jenkins --html --scheme KataLogInLogOutSwift KataLogInLogOutSwift.xcodeproj/'
        
                // Publish coverage results
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'Coverage Report'])
            
                
            }/*, Checkstyle: {

                // Generate Checkstyle report
                sh '/usr/local/bin/swiftlint lint --reporter checkstyle > checkstyle.xml || true'
        
                // Publish checkstyle result
                step([$class: 'CheckStylePublisher', canComputeNew: false, defaultEncoding: '', healthy: '', pattern: 'checkstyle.xml', unHealthy: ''])
            }*/, failFast: true|false   
        }

        /*stage ('Notify') {
            // Send slack notification
            slackSend channel: '#my-team', message: 'Time Table - Successfully', teamDomain: 'my-team', token: 'my-token'
        }*/
    }
}